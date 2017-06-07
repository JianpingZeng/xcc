package jlang.clex;
/*
 * Extremely C language Compiler.
 * Copyright (c) 2015-2017, Xlous Zeng.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied.  See the License for the specific language governing
 * permissions and limitations under the License.
 */

import tools.OutParamWrapper;

/**
 * This decodes string escape characters and performs
 * wide string analysis and Translation Phase #6 (concatenation of string
 * literals) (C99 5.1.1.2p1).
 * @author Xlous.zeng
 * @version 0.1
 */
public class StringLiteralParser
{
    private Preprocessor pp;

    private int maxTokenLength;
    private int sizeBound;
    private StringBuilder resultBuf;
    private int curPos;

    public boolean anyWide;
    public boolean hadError;
    public boolean pascal;

    public StringLiteralParser(Token[] stringToks, Preprocessor pp)
    {
        this.pp = pp;
        maxTokenLength = stringToks[0].getLength();
        sizeBound = stringToks[0].getLength() - 2;  // -2 for "".
        hadError = false;

        // Implement Translation Phase #6: concatenation of string literals
        /// (C99 5.1.1.2p1).  The common case is only one string fragment.
        for (int i = 1; i < stringToks.length; i++)
        {
            Token tok = stringToks[i];
            sizeBound += tok.getLength() - 2;

            if (tok.getLength() > maxTokenLength)
                maxTokenLength = tok.getLength();
        }

        // Include the space for null terminator.
        ++sizeBound;

        pascal = false;

        for (int i = 0, e = stringToks.length; i < e; i++)
        {
            Token tok = stringToks[i];
            String buf = pp.getSpelling(tok);

            assert buf.charAt(0) == '"':"Expected quote, lexer broken?";

            int j = 1;
            while (j < buf.length())
            {
                if (buf.charAt(j) != '\\')
                {
                    int k = j;
                    do
                    {
                        ++j;
                    }while (j < buf.length() && buf.charAt(j) != '\\');

                    // Copy the character span over.
                    while (k < j)
                    {
                        resultBuf.append(buf.charAt(k++));
                    }
                    continue;
                }

                // Is this a Universal Character Name escape?
                if (buf.charAt(j+1) == 'u' || buf.charAt(j+1) == 'U')
                {
                    assert false:"Currently, can not handle unicode character!";
                }

                // Otherwise, this is a non-UCN escape character.  Process it.
                OutParamWrapper<Boolean> x = new OutParamWrapper<>(hadError);
                OutParamWrapper<Integer> y = new OutParamWrapper<>(j);
                char resultChar = LiteralSupport
                        .processCharEscape(buf,y , x, tok.getLocation(), pp);
                hadError = x.get();
                j = y.get();
                // Chop the higher bit than 8 bit.
                resultBuf.append(resultChar & 0xFF);
            }
        }
    }

    public String getString()
    {
        return resultBuf.toString();
    }

    public int getNumStringChars()
    {
        return getString().length();
    }

    public static int getOffsetOfStringByte(Token tok, int byteNo, Preprocessor pp)
    {
        assert byteNo >= 0;

        String spelling = pp.getSpelling(tok);

        assert spelling.charAt(0) != 'L': "Doesn't handle wide strings yet";

        assert spelling.charAt(0) == '"':"Should be a string literal";
        int i = 1;
        while (byteNo != 0)
        {
            assert byteNo < spelling.length();

            if (spelling.charAt(i) != '\\')
            {
                ++i;
                --byteNo;
                continue;
            }

            OutParamWrapper<Boolean> hasError = new OutParamWrapper<>(false);
            OutParamWrapper<Integer> y = new OutParamWrapper<>(i);
            LiteralSupport.processCharEscape(spelling, y, hasError, tok.getLocation(), pp);
            i = y.get();
            assert !hasError.get() : "This method isn't valid on erronuous strings";
            --byteNo;
        }

        return i;
    }
}