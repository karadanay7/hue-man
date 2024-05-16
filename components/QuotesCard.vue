<template>
    <UCard>
      
  
      <div class="mb-4">
        <p>{{ author }}</p>
      </div>
  
      <div class="flex items-center justify-start gap-4">
        <p>{{ quote }}</p>
        </div>
      
    
    </UCard>
  </template>
  
  <script setup>
  defineProps(["author", "quote", ]);

  </script>
  