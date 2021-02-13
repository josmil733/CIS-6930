#include <iostream>
#include "cudaCheck.cuh"

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
   int max_threads_block = 1;
   cudaCheck( cudaDeviceGetAttribute( &max_threads_block,
          cudaDevAttrMaxThreadsPerBlock ,devId) );
  // cudaCheck( cudaDeviceGetAttribute( &max_threads_block,

    std::cout << "Other device properties:\n";
    std::cout << "Max threads/block: " << max_threads_block << std::endl;
    std::cout << "2_Max threads/block: " << prop.maxThreadsPerBlock << std::endl;
//    std::cout << "Max threads/dim:" << prop.maxThreadsDim << std::endl;

/*@  Calculate and print the theoretical peak bandwidth of the
     CUDA device.  You will need to obtain additional information
     from prop.  See the documentation 
*/

  }
  std::cout << "-------------------------------------\n";

}

 
