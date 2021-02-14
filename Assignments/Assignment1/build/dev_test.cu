#include <iostream>
#include "cudaCheck.cuh"
#include <stdio.h>

int main (int argc, char *argv[])
{

  int numDevices;
  cudaCheck( cudaGetDeviceCount(&numDevices));
  // std::cout << "Number of devices: " << numDevices << std::endl;

 

  for (int devId = 0; devId < numDevices; devId++){
     std::cout << "-------------------------------------\n";
     cudaDeviceProp prop;
     cudaCheck( cudaGetDeviceProperties(&prop, devId));
     std::cout << "Device id: " << devId << std::endl;
     std::cout << "Device name: " << prop.name << std::endl;
     std::cout << "-------------------------------------\n";

     std::cout << "Values needed to calculate theoretical peak memory bandwidth (TPMB) (printed from cudaDeviceProp):" << std::endl;
     std::cout << "Memory clock rate (GHz): " << prop.memoryClockRate/1000000 << std::endl;
     std::cout << "Global memory bus width (bits/transfer): " << prop.memoryBusWidth << std::endl;
     std::cout << "(TPMB) Calculation (assuming GDDR6 memory type):\n" << std::endl;
     std::cout << "TPMB = memory clock rate x (global memory bus width/8) x transfers per clock cycle\n" << std::endl;
     printf("    = %i x 10^9 cycles/second x %i B/transfer x 2 transfers/cycle\n", prop.memoryClockRate/1000000, prop.memoryBusWidth/8);
     printf("    = %i GB/s\n", (prop.memoryClockRate/1000000)*(prop.memoryBusWidth/8)*2);

/*     std::cout << "    = 7e9 cycles/second x (352/8) B/transfer x 2 transfers/cycle\n" << std::endl;
     std::cout << "    = 616 GB/s" << std::endl;
*/

//printf("%f.2", prop.memoryClockRate);

   //cudaCheck( cudaDeviceGetAttribute( &max_threads_block,
          //cudaDevAttrMaxThreadsPerBlock ,devId) );


  }
  std::cout << "-------------------------------------\n";

}

 
