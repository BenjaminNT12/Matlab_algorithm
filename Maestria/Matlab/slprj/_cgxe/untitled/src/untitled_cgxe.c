/* Include files */

#include "untitled_cgxe.h"
#include "m_14lqfvNiU50HKPCCIhdsB.h"

unsigned int cgxe_untitled_method_dispatcher(SimStruct* S, int_T method, void
  * data)
{
  if (ssGetChecksum0(S) == 4105463169 &&
      ssGetChecksum1(S) == 736023896 &&
      ssGetChecksum2(S) == 1712581823 &&
      ssGetChecksum3(S) == 2274857221) {
    method_dispatcher_14lqfvNiU50HKPCCIhdsB(S, method, data);
    return 1;
  }

  return 0;
}
