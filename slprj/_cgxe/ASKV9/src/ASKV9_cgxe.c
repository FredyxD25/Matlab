/* Include files */

#include "ASKV9_cgxe.h"
#include "m_6Aw431rf7JSOzkUJgp5SJE.h"

unsigned int cgxe_ASKV9_method_dispatcher(SimStruct* S, int_T method, void* data)
{
  if (ssGetChecksum0(S) == 3053828290 &&
      ssGetChecksum1(S) == 3509026767 &&
      ssGetChecksum2(S) == 1670298536 &&
      ssGetChecksum3(S) == 1745335144) {
    method_dispatcher_6Aw431rf7JSOzkUJgp5SJE(S, method, data);
    return 1;
  }

  return 0;
}
