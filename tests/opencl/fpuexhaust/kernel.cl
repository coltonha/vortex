__kernel void fpuexhaust (__global const float *A,
	                    __global const float *B,
	                    __global float *C)
{
  int gid = get_global_id(0);
  float a = A[gid];
  float b = B[gid];
  float c =0.f;
  #pragma unroll 10
  for (int i = 0; i< 1000; i++) {
    c=a+b+c;
  }
  C[gid] = c;
  
}