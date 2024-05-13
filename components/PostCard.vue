<template>
  <UCard>
    <template #header>
      <div class="flex items-center justify-start">
        <div>
          <img
            :src="userImage"
            alt="User Profile"
            class="w-8 h-8 rounded-full mr-2"
          />
        </div>
        <div>
          <p class="font-semibold">@{{ userName }}</p>
        </div>
      </div>
    </template>

    <div class="mb-4">
      <p>{{ postText }}</p>
    </div>

    <div class="flex items-center justify-start gap-4">
      <div class="flex items-center gap-8">
        <div class="flex items-center gap-1  hover:text-green-600">
            <div><Icon name="i-heroicons-heart" size="20" class="mb-1 hover:scale-125" /></div>
        <div class="text-sm ">{{ likes }}</div>
        </div>

        <div class="hover:text-green-600  hover:scale-125"><Icon name="ant-design:retweet-outlined" size="20" class="mb-1 " /></div>
      </div>
    
    </div>
  </UCard>
</template>

<script setup>
defineProps(["userName", "userImage", "postText", "likes"]);
const likePost = () => {};
</script>
