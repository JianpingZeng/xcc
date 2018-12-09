package backend.target;
/*
 * Extremely C language Compiler
 * Copyright (c) 2015-2018, Jianping Zeng.
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

/**
 * @author Jianping Zeng
 * @version 0.4
 */
public class SubtargetFeatureKV implements Comparable<SubtargetFeatureKV> {
  public String key;
  public String desc;
  public int value;
  public int implies;

  @Override
  public int compareTo(SubtargetFeatureKV o) {
    return key.compareTo(o.key);
  }

  public SubtargetFeatureKV(String k, String d, int val, int imp) {
    key = k;
    desc = d;
    value = val;
    implies = imp;
  }
}
