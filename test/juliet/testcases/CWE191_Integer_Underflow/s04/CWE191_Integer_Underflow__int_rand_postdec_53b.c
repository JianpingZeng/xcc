/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE191_Integer_Underflow__int_rand_postdec_53b.c
Label Definition File: CWE191_Integer_Underflow__int.label.xml
Template File: sources-sinks-53b.tmpl.c
*/
/*
 * @description
 * CWE: 191 Integer Underflow
 * BadSource: rand Set data to result of rand(), which may be zero
 * GoodSource: Set data to a small, non-zero number (negative two)
 * Sinks: decrement
 *    GoodSink: Ensure there will not be an underflow before decrementing data
 *    BadSink : Decrement data, which can cause an Underflow
 * Flow Variant: 53 Data flow: data passed as an argument from one function through two others to a fourth; all four functions are in different source files
 *
 * */

#include "std_testcase.h"

#ifndef OMITBAD

/* bad function declaration */
void CWE191_Integer_Underflow__int_rand_postdec_53c_badSink(int data);

void CWE191_Integer_Underflow__int_rand_postdec_53b_badSink(int data)
{
    CWE191_Integer_Underflow__int_rand_postdec_53c_badSink(data);
}

#endif /* OMITBAD */

#ifndef OMITGOOD

/* goodG2B uses the GoodSource with the BadSink */
void CWE191_Integer_Underflow__int_rand_postdec_53c_goodG2BSink(int data);

void CWE191_Integer_Underflow__int_rand_postdec_53b_goodG2BSink(int data)
{
    CWE191_Integer_Underflow__int_rand_postdec_53c_goodG2BSink(data);
}

/* goodB2G uses the BadSource with the GoodSink */
void CWE191_Integer_Underflow__int_rand_postdec_53c_goodB2GSink(int data);

void CWE191_Integer_Underflow__int_rand_postdec_53b_goodB2GSink(int data)
{
    CWE191_Integer_Underflow__int_rand_postdec_53c_goodB2GSink(data);
}

#endif /* OMITGOOD */