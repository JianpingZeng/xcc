package utils.tablegen;
/*
 * Extremely C language Compiler
 * Copyright (c) 2015-2018, Jianping Zeng.
 * All rights reserved.
 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the <organization> nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import tools.Error;

import java.util.ArrayList;

/**
 * @author Jianping Zeng.
 * @version 0.4
 */
public class SDNodeProperties {
  static int parseSDPatternOperatorProperties(Record r) {
    int properties = 0;
    ArrayList<Record> propList = r.getValueAsListOfDefs("Properties");
    for (Record prop : propList) {
      switch (prop.getName()) {
        case "SDNPCommutative":
          properties |= 1 << SDNP.SDNPCommutative;
          break;
        case "SDNPAssociative":
          properties |= 1 << SDNP.SDNPAssociative;
          break;
        case "SDNPHasChain":
          properties |= 1 << SDNP.SDNPHasChain;
          break;
        case "SDNPOutFlag":
          properties |= 1 << SDNP.SDNPOutFlag;
          break;
        case "SDNPInFlag":
          properties |= 1 << SDNP.SDNPInFlag;
          break;
        case "SDNPOptInFlag":
          properties |= 1 << SDNP.SDNPOptInFlag;
          break;
        case "SDNPMayStore":
          properties |= 1 << SDNP.SDNPMayStore;
          break;
        case "SDNPMayLoad":
          properties |= 1 << SDNP.SDNPMayLoad;
          break;
        case "SDNPSideEffect":
          properties |= 1 << SDNP.SDNPSideEffect;
          break;
        case "SDNPMemOperand":
          properties |= 1 << SDNP.SDNPMemOperand;
          break;
        case "SDNPVariadic":
          properties |= 1 << SDNP.SDNPVariadic;
          break;
        default:
          Error.printError("Undefined SD Node property '" + prop.getName()
              + "' on node '" + r.getName() + "'!");
          System.exit(1);
      }
    }
    return properties;
  }
}
