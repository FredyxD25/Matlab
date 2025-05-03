/* Include files */

#include "QAMV2_cgxe.h"
#include "m_m25svM7vlbcpvjdO12kRn.h"

unsigned int cgxe_QAMV2_method_dispatcher(SimStruct* S, int_T method, void* data)
{
  if (ssGetChecksum0(S) == 3063838348 &&
      ssGetChecksum1(S) == 3014421824 &&
      ssGetChecksum2(S) == 253064453 &&
      ssGetChecksum3(S) == 2362722903) {
    method_dispatcher_m25svM7vlbcpvjdO12kRn(S, method, data);
    return 1;
  }

  return 0;
}
