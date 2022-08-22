/* Include files */

#include "fcn_cgxe.h"
#include "m_bmY0zbOLYJ6kt4q6YbT7mF.h"

unsigned int cgxe_fcn_method_dispatcher(SimStruct* S, int_T method, void* data)
{
  if (ssGetChecksum0(S) == 1906581924 &&
      ssGetChecksum1(S) == 1538849266 &&
      ssGetChecksum2(S) == 4149514654 &&
      ssGetChecksum3(S) == 1206014536) {
    method_dispatcher_bmY0zbOLYJ6kt4q6YbT7mF(S, method, data);
    return 1;
  }

  return 0;
}
