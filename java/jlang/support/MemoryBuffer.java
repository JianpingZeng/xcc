package jlang.support;

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

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.CharBuffer;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;

/**
 * @author Xlous.zeng
 * @version 0.1
 */
public class MemoryBuffer implements Cloneable
{
    private char[] buffer;
    private int bufferStart;
    private String filename;
    private boolean isRegular;

    public MemoryBuffer(char[] buffer)
    {
        this.buffer = new char[buffer.length];
        System.arraycopy(buffer, 0, this.buffer, 0, buffer.length);
    }

    public String getFilename()
    {
        return filename;
    }

    public void setFilename(String filename)
    {
        this.filename = filename;
    }

    public char[] getBuffer()
    {
        return buffer;
    }

    public int length()
    {
        return buffer.length;
    }

    /**
     * Determines whether this memory buffer is read from regular file (either stdin nor memory).
     * @return
     */
    public boolean isRegular()
    {
        return isRegular;
    }

    public void setRegular(boolean regular)
    {
        isRegular = regular;
    }

    public int getBufferStart()
    {
        return bufferStart;
    }

    public void advance()
    {
        ++bufferStart;
    }

    /**
     * Obtains the current character indexed by {@linkplain #bufferStart}
     * from CharBuffer.
     * @return
     */
    public char getCurChar()
    {
        return buffer[bufferStart];
    }

    public char getCharAt(int i)
    {
        int len = length();
        if (i>= getBufferStart() && i < len)
            return buffer[i];
        return 0;
    }

    public String getSubString(int lineStart, int lineEnd)
    {
        assert 0 <= lineStart && lineStart <= lineEnd
                && lineEnd < buffer.length;
        StringBuilder sb = new StringBuilder();
        for (int i = lineStart; i < lineEnd; i++)
            sb.append(buffer[i]);

        return sb.toString();
    }

    /**
     * Checks if the other MemoryBuffer is within the current
     * MemoryBuffer.
     * @param other
     * @return
     */
    public boolean contains(MemoryBuffer other)
    {
        boolean b1 = Arrays.equals(buffer, other.getBuffer()) ,
                b2 = other.getBufferStart() >= bufferStart,
                b3 = other.getBufferStart() <= buffer.length;   // must be less and equal.
        return b1 && b2 && b3;
    }

    @Override
    public boolean equals(Object obj)
    {
        if (obj == null) return false;
        if (obj == this) return true;

        if (getClass() != obj.getClass())
            return false;
        MemoryBuffer memBuf = (MemoryBuffer)obj;
        return bufferStart == memBuf.bufferStart && Arrays
                .equals(buffer, memBuf.buffer);
    }

    @Override
    public MemoryBuffer clone()
    {
        try
        {
            return (MemoryBuffer)super.clone();
        }
        catch (Exception e)
        {
            return null;
        }
    }

    public void setBufferStart(int bufferStart)
    {
        this.bufferStart = bufferStart;
    }

    public static MemoryBuffer getFile(Path path)
    {
        String file = null;
        long sz = 0;
        try
        {
            sz = Files.size(path);
            file = path.toFile().getCanonicalPath();
        }
        catch (IOException e)
        {
            System.err.println("Obtain the size of '"+ path.toString() + "' failed");
            System.exit(1);
        }
        /*
        if (sz >= 4 * 1024)
        {
            try (FileChannel channel = FileChannel.open(path))
            {
                ByteBuffer cb = channel.map(FileChannel.MapMode.READ_ONLY, 0, sz);
                CharBuffer charBuf = cb.asCharBuffer();

                MemoryBuffer mb = new MemoryBuffer(charBuf.array());
                mb.setFilename(file);
                mb.setRegular(true);
                return mb;
            }
            catch (IOException ignored) {}
        }
        */

        try (BufferedReader reader = Files.newBufferedReader(path))
        {
            CharBuffer cb = CharBuffer.allocate((int)sz);
            int res = reader.read(cb);
            MemoryBuffer mb = new MemoryBuffer(cb.array());
            mb.setFilename(file);
            mb.setRegular(true);
            return mb;
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return null;
    }

    public static MemoryBuffer getFile(String filename)
    {
        Path path = Paths.get(filename);
        if (!Files.exists(path))
        {
            System.err.println("File '"+ filename + "' is not exists");
            System.exit(1);
        }

        return getFile(path);
    }

    public static MemoryBuffer getSTDIN()
    {
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(System.in)))
        {
            int sz = System.in.available();
            char[] buf = null;
            if (sz <= 0)
            {
                return null;
            }

            buf = new char[sz];
            int offset = 0;
            do
            {
                sz = reader.read(buf, offset, sz);
                if (sz < 0)
                    break;

                offset += sz;

                char[] newArray = new char[buf.length * 2];
                System.arraycopy(buf, 0, newArray, 0, buf.length);
                buf = newArray;
            }while (true);

            char[] newBuf = new char[offset];
            System.arraycopy(buf, 0, newBuf, 0, offset);
            MemoryBuffer mb = new MemoryBuffer(newBuf);
            mb.setFilename("-");
            mb.setRegular(false);
            return mb;
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return null;
    }

    public static MemoryBuffer getFileOrSTDIN(String filename)
    {
        if (!filename.equals("-") && !filename.isEmpty())
            return getFile(filename);
        MemoryBuffer m = getSTDIN();
        if (m != null) return m;

        // If stdin was empty, M is null.  Cons up an empty memory buffer now.
        return MemoryBuffer.getMemBuffer("", "<stdin>");
    }

    public String getBufferName()
    {
        return "mapped buffer";
    }

    /**
     * Allocate a new MemoryBuffer of the specified size that
     * is completely initialized to zeros.  Note that the caller should
     * initialize the memory allocated by this method.  The memory is owned by
     * the MemoryBuffer object.
     * @param size
     * @param bufferName
     * @return
     */
    public static MemoryBuffer getNewMemBuffer(int size, String bufferName)
    {
        char[] buf = new char[size];
        return new MemoryBufferMem(buf, bufferName);
    }

    static class MemoryBufferMem extends MemoryBuffer
    {
        private String fileID;

        public MemoryBufferMem(char[] buffer, String fid)
        {
            super(buffer);
            fileID = fid;
        }

        @Override
        public String getBufferName()
        {
            return fileID;
        }

        /**
         * Determines whether this memory buffer is read from regular file (either stdin nor memory).
         * @return
         */
        public boolean isRegular()
        {
            return false;
        }
    }

    public static MemoryBuffer getMemBuffer(String buffer, String name)
    {
        return new MemoryBufferMem(buffer.toCharArray(), name);
    }
}