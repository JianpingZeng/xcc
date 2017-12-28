/*
 * Extremely C language Compiler
 * Copyright (c) 2015-2017, Xlous Zeng.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied.  See the License for the specific language governing
 * permissions and limitations under the License.
 */

package backend.codegen;

import backend.pass.AnalysisUsage;
import backend.target.TargetRegisterClass;
import backend.target.TargetRegisterInfo;
import backend.value.Module;
import gnu.trove.iterator.TIntObjectIterator;
import gnu.trove.map.hash.TIntObjectHashMap;

import java.io.PrintStream;

/**
 * This Pass used for computing liveness for stack slot analog to virtual register.
 * It can reuse some stack slot to avoding redundant slot by liveness analysis on
 * stack slot.
 * @author Xlous.zeng
 * @version 0.1
 */
public final class LiveStackSlot extends MachineFunctionPass
{
    private TIntObjectHashMap<LiveInterval> slot2LI;
    private TIntObjectHashMap<TargetRegisterClass> slot2RC;
    public LiveStackSlot()
    {
        slot2LI = new TIntObjectHashMap<>();
        slot2RC = new TIntObjectHashMap<>();
    }

    @Override
    public boolean runOnMachineFunction(MachineFunction mf)
    {
        // This method should not called from FunctionPassManager.
        return false;
    }

    @Override
    public String getPassName()
    {
        return "Live Stack Slot Analysis Pass";
    }

    public LiveInterval getOrCreateInterval(int slot, TargetRegisterClass rc)
    {
        assert slot >= 0 :"Spill slot indice must be >= 0";
        if (!slot2LI.containsKey(slot))
        {
            LiveInterval li = new LiveInterval(slot, 0.0f, true);
            slot2LI.put(slot, li);
            return li;
        }
        else
        {
            // Use the largest common subclass register class
            assert slot2RC.containsKey(slot);
            TargetRegisterClass oldRC = slot2RC.get(slot);
            assert oldRC != null;
            slot2RC.put(slot, TargetRegisterInfo.getCommonSubClass(oldRC,rc));
            return slot2LI.get(slot);
        }
    }

    public LiveInterval getInterval(int slot)
    {
        assert slot >= 0:"Spill stack slot must be >= 0";
        assert slot2LI.containsKey(slot):"Interval doesn't exist for stack slot #" + slot;
        return slot2LI.get(slot);
    }

    public boolean hasInterval(int slot)
    {
        return slot2LI.containsKey(slot);
    }

    public TargetRegisterClass getIntervalRegClass(int slot)
    {
        assert slot >= 0:"Spill stack slot must be >= 0";
        assert slot2RC.containsKey(slot):"RegClass doesn't exist for stack slot #" + slot;
        return slot2RC.get(slot);
    }

    @Override
    public void getAnalysisUsage(AnalysisUsage au)
    {
        au.setPreservedAll();
        super.getAnalysisUsage(au);
    }

    @Override
    public void print(PrintStream os, Module m)
    {
        os.println("**************** Intervals ******************");
        TIntObjectIterator<LiveInterval> itr = slot2LI.iterator();
        while (itr.hasNext())
        {
            int slot = itr.key();
            LiveInterval interval = itr.value();
            interval.print(os, null);
            TargetRegisterClass rc = getIntervalRegClass(slot);
            if (rc != null)
            {
                os.printf("[%s]\n", rc.getName());
            }
            else
            {
                os.println("[unknown]");
            }
        }
    }
}