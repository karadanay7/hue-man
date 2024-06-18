<template>
    <UContainer>
        <div class="text-gray-800 dark:text-gray-200  flex flex-col items-center">
      <!-- Profile Header -->
      <div class="w-2/3 bg-primary dark:bg-green-600 p-6 flex justify-between items-center rounded-xl">
        <div class="flex items-center gap-4">
          <img
            class="h-20 w-20 rounded-full"
            src="https://static.vecteezy.com/system/resources/previews/002/002/257/non_2x/beautiful-woman-avatar-character-icon-free-vector.jpg"
            alt="Profile Picture"
          />
          <div>
            <h1 class="text-2xl font-semibold text-gray-100">Jane Doe</h1>
            {{ user }}
            <p class="text-md text-gray-300">jane.doe@example.com</p>
          </div>
        </div>
        <button class="flex items-center gap-2 bg-white dark:bg-gray-800 p-3 rounded-full border-2 border-gray-600 dark:border-white hover:scale-110 transition-transform duration-200 ease-in-out">
          <Icon name="ant-design:edit-outlined" size="30" />
          <span class="text-md font-semibold text-gray-600 dark:text-gray-100">Edit Profile</span>
        </button>
      </div>
  
      <!-- Profile Content -->
      <div class="w-2/3 flex flex-col items-center gap-4 p-6">
        <!-- Personal Information Section -->
        <div class="w-full max-w-4xl bg-gray-100 dark:bg-gray-800 p-6 rounded-lg shadow-md">
          <h2 class="text-2xl font-semibold mb-4">Personal Information</h2>
          <div class="flex flex-col gap-2">
            <div class="flex justify-between">
              <span class="font-medium">Full Name:</span>
              <span>Jane Doe</span>
            </div>
            <div class="flex justify-between">
              <span class="font-medium">Email:</span>
              <span>jane.doe@example.com</span>
            </div>
            <div class="flex justify-between">
              <span class="font-medium">Phone:</span>
              <span>(123) 456-7890</span>
            </div>
            <div class="flex justify-between">
              <span class="font-medium">Address:</span>
              <span>123 Main Street, Anytown, USA</span>
            </div>
          </div>
        </div>
  
        <!-- Account Settings Section -->
        <div class="w-full max-w-4xl bg-gray-100 dark:bg-gray-800 p-6 rounded-lg shadow-md">
          <h2 class="text-2xl font-semibold mb-4">Account Settings</h2>
          <div class="flex flex-col gap-2">
            <div class="flex justify-between items-center">
              <span class="font-medium">Enable Dark Mode:</span>
              <UToggle v-model="isDark" on-icon="i-heroicons-moon" off-icon="i-heroicons-sun" size="lg" />
            </div>
            <div class="flex justify-between items-center">
              <span class="font-medium">Email Notifications:</span>
              <UToggle v-model="emailNotifications" size="lg" />
            </div>
            <div class="flex justify-between items-center">
              <span class="font-medium">Two-Factor Authentication:</span>
              <UToggle v-model="twoFactorAuth" size="lg" />
            </div>
          </div>
        </div>
  
        <!-- User Posts Section -->
        <div class="w-full max-w-4xl bg-gray-100 dark:bg-gray-800 p-6 rounded-lg shadow-md">
          <h2 class="text-2xl font-semibold mb-4">Your Posts</h2>
          <div class="flex flex-col gap-4">
            <div v-for="post in userPosts" :key="post.id" class="bg-white dark:bg-gray-700 p-4 rounded-lg shadow">
              <h3 class="text-xl font-semibold">{{ post.title }}</h3>
              <p class="text-gray-600 dark:text-gray-300">{{ post.content }}</p>
              <span class="text-sm text-gray-500 dark:text-gray-400">{{ post.date }}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    </UContainer>
   
  </template>
  
  <script setup>

const user = useSupabaseUser();
  const isDark = ref(false);
  const emailNotifications = ref(true);
  const twoFactorAuth = ref(false);
  
  // Sample user posts data
  const userPosts = ref([
    { id: 1, title: 'First Post', content: 'This is the content of the first post.', date: '2023-01-01' },
    { id: 2, title: 'Second Post', content: 'This is the content of the second post.', date: '2023-02-15' },
    { id: 3, title: 'Third Post', content: 'This is the content of the third post.', date: '2023-03-30' },
  ]);
  </script>
  
  <style scoped>
  /* Add any additional styling you need here */
  </style>
  