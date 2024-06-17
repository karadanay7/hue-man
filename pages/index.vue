<template>
  <div class="text-gray-800 dark:text-gray-200 h-screen flex flex-col justify-around items-center">
    <!-- Hue-Man component -->
    <Hue-Man />

    <!-- Rise, Reflect, Inspire text -->
    <div class="text-primary-800 dark:text-gray-200">
      <h2 class="text-center text-3xl md:text-4xl font-author tracking-wide font-semibold pt-10">"Rise, Reflect, Inspire"</h2>
    </div>

    <!-- Start Your Journey section -->
    <div class="flex flex-col items-center justify-center gap-2">
      <h1 class="text-2xl md:text-4xl font-bold">Start Your Journey Today!</h1>
      <UButton color="white" size="lg">
        <ULink to="/signup">Sign Up Now!</ULink>
      </UButton>
    </div>
  </div>

  <!-- Section for HomeCarousel component -->
  <div class="h-full">
    <HomeCarousel />
  </div>
  
  <!-- Success Stories Section -->
  <div class="w-1/2  flex flex-col   dark:bg-white dark:bg-opacity-20 mx-auto gap-6 rounded-lg p-4 mt-16 text-gray-200  bg-green-950 bg-opacity-80 ">
   
    <div class="flex flex-col md:flex-row items-center justify-center gap-4">
     
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0QHwlwCL3cBnxnmXZk6ze1bH4pFKaAGdsfQ&s" alt="Success Story Image" class="h-12 w-12 rounded-full shadow-md" />
      <div class="text-center md:text-left ">
        <p class="font-semibold text-xl "> Emily S. - Fitness Enthusiast :</p>
        <p class="text-lg ">"I struggled with maintaining a consistent workout routine, but since using this app, I've been motivated to exercise every day. The daily quotes and personal goal reminders keep me focused and energized. It's like having a personal coach in my pocket!"</p>
      </div>
    </div>
    <div class="flex flex-col md:flex-row items-center justify-center gap-4">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTb6Ict8PJGdPthDh3tSiEH_bBZDgd1gDERkQ&s" alt="Success Story Image" class="h-12 w-12 rounded-full shadow-md" />
      <div class="text-center md:text-left">
        <p class="font-semibold text-xl "> Lisa M. - Student :</p>
        <p class="text-lg ">"Starting my own business seemed like an impossible dream, but this app gave me the daily inspiration and confidence I needed. The success stories and motivational tips helped me stay positive and overcome challenges. I'm now running a successful startup and couldn't be happier!"</p>
      </div>
    </div>
  </div>
  

 



 
</template>

