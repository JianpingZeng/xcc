package tools.commandline;
/*
 * Extremely C language Compiler.
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

import tools.OutRef;
import tools.Pair;
import tools.Util;

import java.util.ArrayList;

import static tools.commandline.CL.markOptionsChanged;

/**
 * @author Jianping Zeng
 * @version 0.4
 */
public class Parser<T> implements ParserInterface<T> {
  protected ArrayList<Pair<String, Pair<T, String>>> values;
  protected boolean hasOptionName;

  public int getNumOptions() {
    return values.size();
  }

  public String getOption(int index) {
    return values.get(index).first;
  }

  public String getDescription(int index) {
    return values.get(index).second.second;
  }

  public Parser() {
    values = new ArrayList<>();
    hasOptionName = false;
  }

  @Override
  public boolean parse(Option<?> opt, String optName, String arg,
                       OutRef<T> val) {
    String argVal = hasOptionName ? arg : optName;

    for (int i = 0, e = values.size(); i < e; ++i) {
      if (argVal.equals(values.get(i).first)) {
        val.set(values.get(i).second.first);
        return false;
      }
    }
    return opt.error("Cannot find option named '" + argVal + "'!");
  }

  public void addLiteralOption(String name, T val, String helpStr) {
    Util.assertion(findOption(name) < 0, "OptionInfo already exists!");
    values.add(Pair.get(name, Pair.get(val, helpStr)));
    markOptionsChanged();
  }

  /**
   * Remove the specified option at the specified position.
   *
   * @param name
   */
  public void removeLiteralOption(String name) {
    int index = findOption(name);
    Util.assertion(index >= 0, "OptionInfo not found!");
    values.remove(index);
  }

  @Override
  public <T1> void initialize(Option<T1> opt) {
    hasOptionName = opt.hasOptionName();
  }

  @Override
  public ValueExpected getValueExpectedFlagDefault() {
    if (hasOptionName)
      return ValueExpected.ValueRequired;
    else
      return ValueExpected.ValueDisallowed;
  }

  /**
   * Return the option number corresponding to the specified
   * // argument string.  If the option is not found, {@code -1} is returned.
   *
   * @param name
   * @return
   */
  public int findOption(String name) {
    for (int i = 0, e = getNumOptions(); i < e; ++i) {
      if (getOption(i).equals(name))
        return i;
    }
    return -1;
  }

  @Override
  public void getExtraOptionNames(ArrayList<String> optionNames) {
    if (!hasOptionName)
      for (int i = 0, e = getNumOptions(); i < e; i++)
        optionNames.add(getOption(i));
  }
}
