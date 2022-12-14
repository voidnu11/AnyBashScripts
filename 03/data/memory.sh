#!/bin/bash

declare -a NODE=(
  "node_memory_Active_bytes"
  "node_memory_Active_anon_bytes"
  "node_memory_Active_file_bytes"
  "node_memory_AnonHugePages_bytes"
  "node_memory_AnonPages_bytes"
  "node_memory_Bounce_bytes"
  "node_memory_Buffers_bytes"
  "node_memory_Cached_bytes"
  "node_memory_CmaFree_bytes"
  "node_memory_CmaTotal_bytes"
  "node_memory_CommitLimit_bytes"
  "node_memory_Committed_AS_bytes"
  "node_memory_DirectMap2M_bytes"
  "node_memory_DirectMap4k_bytes"
  "node_memory_Dirty_bytes"
  "node_memory_FileHugePages_bytes"
  "node_memory_FilePmdMapped_bytes"
  "node_memory_HardwareCorrupted_bytes"
  "node_memory_HugePages_Free"
  "node_memory_Hugepagesize_bytes"
  "node_memory_HugePages_Rsvd"
  "node_memory_HugePages_Surp"
  "node_memory_HugePages_Total"
  "node_memory_Hugetlb_bytes"
  "node_memory_Inactive_bytes"
  "node_memory_Inactive_anon_bytes"
  "node_memory_Inactive_file_bytes"
  "node_memory_KernelStack_bytes"
  "node_memory_KReclaimable_bytes"
  "node_memory_Mapped_bytes"
  "node_memory_MemAvailable_bytes"
  "node_memory_MemFree_bytes"
  "node_memory_MemTotal_bytes"
  "node_memory_Mlocked_bytes"
  "node_memory_NFS_Unstable_bytes"
  "node_memory_PageTables_bytes"
  "node_memory_Percpu_bytes"
  "node_memory_Shmem_bytes"
  "node_memory_ShmemHugePages_bytes"
  "node_memory_ShmemPmdMapped_bytes"
  "node_memory_Slab_bytes"
  "node_memory_SReclaimable_bytes"
  "node_memory_SUnreclaim_bytes"
  "node_memory_SwapCached_bytes"
  "node_memory_SwapFree_bytes"
  "node_memory_SwapTotal_bytes"
  "node_memory_Unevictable_bytes"
  "node_memory_VmallocChunk_bytes"
  "node_memory_VmallocTotal_bytes"
  "node_memory_VmallocUsed_bytes"
  "node_memory_Writeback_bytes"
  "node_memory_WritebackTmp_bytes"
)
