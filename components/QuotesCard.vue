<template>
    <UCard class="font-sans text-center">
      
  
     
      <div class=" text-2xl font-quote">
        <p><Icon name="fe:quote-left" class="-mt-4" size="16"/>{{ quote }}<Icon name="fe:quote-right" class="-mt-4" size="16"/></p>
        </div>
        <div class="mt-4  font-author ">
        <p class="border-b inline-block text-lg">{{ author }}</p>
      </div>
  
      
    
    </UCard>
  </template>
  
  <script setup>
  defineProps(["author", "quote", ]);

  </script>
  