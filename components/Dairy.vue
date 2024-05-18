<template>
  <UCard>
    <!-- Header -->
    <template #header>
      <div class="flex items-center justify-start gap-2 ">
        <!-- Default User Image (or no image) -->
        <img class="h-8 w-8 rounded-full" src="https://static.vecteezy.com/system/resources/previews/002/002/257/non_2x/beautiful-woman-avatar-character-icon-free-vector.jpg" alt="">
        <!-- User Name -->
        <p class="font-semibold">ME</p>
        <span class="text-gray-500 dark:text-gray-400"> &#9702;</span>
        <p class="text-gray-500 dark:text-gray-400 text-sm mt-px">{{ formatDate(createdAt) }}</p>
      </div>
    </template>

    <!-- Post Content -->
    <div class="mb-4">
      <p>{{ content }}</p>
    </div>
  </UCard>
</template>

<script setup lang="ts">
type Props = {
  content: string | undefined;
  createdAt: string;
}
defineProps<Props>();

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
