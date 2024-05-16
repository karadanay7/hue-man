<template>
    
   
      <Header />
    

      <UContainer class="flex flex-col items-center justify-center">
        <h1 class="text-center  text-lg md:text-2xl text-green-600">Welcome to your Free-place...</h1>
      <p class=" text-gray-400  text-xs md:text-sm w-full">
  Take a moment to reflect on your journey. 
  How are you progressing towards your goals?
   What challenges have you encountered, 
   and how did you overcome them? Feel free to share your thoughts, 
   experiences, and any breakthroughs you've had along the way. 
   This is your space to document and celebrate your personal growth.
</p>
        <div class="p-4 w-full lg:w-1/2">
          <div class="usernote">
            <div class="flex items-center gap-2">
              <div v-if="user && userImage">
                <!-- Display the image -->
                <img
                  :src="userImage"
                  alt="userProfile"
                  class="w-14 rounded-full"
                />
              </div>
              <div v-else>
                <!-- Placeholder if user or image not available -->
                
              </div>
              <div class="w-full">
                <UTextarea
                  v-model="newNote"
                  color="primary"
                  variant="outline"
                  placeholder="Write a note..."
                />
              </div>
              <div>
                <UButton @click="addNote">Save</UButton>
              </div>
            </div>
          </div>
          <!-- Display all notes inside the "notes" div -->
          <div class="notes mt-4 w-full">
            <ul class="flex flex-col items-stretch gap-4">
              <li v-for="note in notes" :key="note.id" class="rounded-lg px-4 py-2 bg-white shadow">
                <p class="text-lg">{{ note.text }}</p>
                <p class="text-sm text-gray-500">Saved on {{ note.date }}</p>
              </li>
            </ul>
          </div>
        </div>
      </UContainer>
  
  </template>
  