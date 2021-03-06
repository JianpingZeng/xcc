package tools;
/*
 * Extremely C Compiler Collection
 * Copyright (c) 2015-2020, Jianping Zeng
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
 * This class takes a role in wrapping a out parameter in parameter list.,
 * so that simulates the semantic of 'out' keyword of C#.
 *
 * @author Jianping Zeng
 * @version 0.4
 */
public final class OutRef<T> {
  private Object[] ptr;

  public OutRef() {
    ptr = new Object[1];
  }

  public OutRef(T data) {
    ptr = new Object[1];
    ptr[0] = data;
  }

  /**
   * Obtains the actual data which this wrapper contains.
   *
   * @return
   */
  public T get() {
    return (T) ptr[0];
  }

  /**
   * Sets the inner data which this wrapper contains.
   *
   * @param data
   */
  public void set(T data) {
    ptr[0] = data;
  }
}
