<template>
  <UCard>
    <!-- Header -->
    <template #header>
      <div class="flex items-center justify-start gap-2 ">
        <!-- Default User Image (or no image) -->
       
        <!-- User Name -->
        <img  class="h-8 w-8 rounded-full" src="https://static.vecteezy.com/system/resources/previews/002/002/257/non_2x/beautiful-woman-avatar-character-icon-free-vector.jpg" alt="">
       
          <p class="font-semibold">{{ userName }}</p>
        <span class="text-gray-500 dark:text-gray-400 "> &#9702;</span>

          <p class="text-gray-500 dark:text-gray-400  text-sm  mt-px">{{ formatDate(createdAt) }}</p>
      
      </div>
    </template>

    <!-- Post Content -->
    <div class="mb-4">
      <p>{{ content }}</p>
    </div>

    <!-- Interaction Buttons -->
    <div class="flex items-center justify-start gap-4">
      <div class="flex items-center gap-8">
        <!-- Like Button -->
        <div class="flex items-center gap-1 hover:text-green-600" @click="likePost">
          <div><Icon name="i-heroicons-heart" size="20" class="mb-1 hover:scale-125" /></div>
          <div class="text-sm">{{ likes }}</div>
        </div>

        <!-- Retweet Button -->
        <div class="hover:text-green-600 hover:scale-125">
          <Icon name="ant-design:retweet-outlined" size="20" class="mb-1" />
        </div>
      </div>
    </div>
  </UCard>
</template>

<script setup lang="ts">
type Likes = {
  id: string;
  userId: string
  postId: number;
}
type Props = {
  userName: string | undefined;
  content: string | undefined;
  likes: Likes;
  createdAt : string;
}
defineProps<Props>();

// Function to handle liking a post (you can implement this)
const likePost = () => {
  // Implement your logic to like the post
};
const formatDate = (timeString: string) => {
  const postDate = new Date(timeString);
  const currentDate = new Date();

  const timeDiff = currentDate.getTime() - postDate.getTime();
  const minutes = Math.floor(timeDiff / (1000 * 60));
  const hours = Math.floor(timeDiff / (1000 * 60 * 60));
  const days = Math.floor(timeDiff / (1000 * 60 * 60 * 24));

  if (days >= 1) {
    return `${days}d `;
  } else if (hours >= 1) {
    return `${hours}h `;
  } else if (minutes > 0) {
    return `${minutes}m `;
  } else {
    return 'just now';
  }
};

</script>
