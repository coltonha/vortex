__kernel void stresssfusync (__global const int *A,
	                    __global int *C, __local int* values)
{
  int local_size = get_local_size(0);
  int gid = get_global_id(0);
  int lid = get_local_id(0);
  // int numWorkItemsPerGroup = get_local_size(0);
  int a = A[gid];
  int c = 0;
  // __local int values[numWorkItemsPerGroup];

  #pragma unroll 10
  for (int i = 0; i< 100; i++) {
    values[lid] = a;
    barrier(CLK_LOCAL_MEM_FENCE);
    for (int stride = 2; stride > 0; stride /= 2) {
      if (lid < stride) {
        values[lid] += values[lid + stride];
      }
      barrier(CLK_LOCAL_MEM_FENCE);
    }
    c = values[lid];
  }
  C[gid] = c;
}