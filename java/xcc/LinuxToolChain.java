/*
 * Extremely C language Compiler.
 * Copyright (c) 2015-2017, Xlous zeng.
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

package xcc;

import backend.support.Triple;
import xcc.HostInfo.LinuxHostInfo;

import javax.tools.Tool;

public class LinuxToolChain extends ToolChain
{
    public LinuxToolChain(LinuxHostInfo linuxHostInfo, Triple triple)
    {
        super(linuxHostInfo, triple);
    }

    @Override
    public Tool selectTool(Compilation c, Action.JobAction ja)
    {
        return null;
    }
}
