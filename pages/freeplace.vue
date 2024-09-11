<template>
  

  <UContainer >
    <div class="flex flex-col items-center justify-center mt-8 pl-12 ">
    <div class="  flex flex-col gap-4 w-full lg:w-2/3  ">
      <h1 class="text-center text-lg md:text-3xl text-green-600">
      Welcome to your Free-place...
    </h1>
    <p class="text-gray-300 text-md md:text-lg w-full text-center">
      Take a moment to reflect on your journey. Write down your thoughts, feelings, and experiences.
    </p>
    </div>
   
    <div class="p-4 w-full lg:w-1/2 ">
    
        <div class="flex items-center gap-2">
          <div v-if="user">
          
            <img src="https://static.vecteezy.com/system/resources/previews/002/002/257/non_2x/beautiful-woman-avatar-character-icon-free-vector.jpg" alt="userProfile" class="w-14 rounded-full" />
          </div>
          <div v-else>
     
          </div>
          <div class="w-full">
            <UTextarea
              v-model="content"
              color="primary"
              variant="outline"
              placeholder="Write a note..."
            />
          </div>
          <div>
            <UButton @click="AddNote">Save</UButton>
          </div>
        </div>
     
     
     
    </div>
    <div class="w-full lg:w-2/3">
    
    <div v-if="diaries">
      <ul class="flex flex-col gap-3">
        <li v-for="diary in diaries" :key="diary.id" class="rounded-lg px-2">
          <!-- Dairy component to display each diary entry -->
          <Dairy
            :content="diary.content"
            :createdAt="diary.createdAt"
          />
        </li>
      </ul>
    </div>
    <div v-else>nothing to display</div>
  </div>
</div>
  </UContainer>
</template>

<script setup lang="ts" >

definePageMeta({
  middleware: 'auth'
})

const user = useSupabaseUser();


const userId = user.value?.id;
const diariesResponse = await useFetch(`/api/prisma/get-diaries/${userId}`);
const diaries = computed(() => {
  
    return diariesResponse.data?.value.sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime()) ?? [];
  
});


const content = ref("");
const isLoading = ref(false);

const AddNote = async () => {
  isLoading.value = true;

  const requestBody = {
    userId: userId,
    content: content.value,
  };

  try {
    const response = await fetch("/api/prisma/add-diary/", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(requestBody),
    });

    if (response.ok) {
      // Re-fetch diaries after adding a new note
      await diariesResponse.refresh();
    } else {
      console.error("Failed to add post");
    }
  } catch (error) {
    console.error("Error occurred while adding post:", error);
  } finally {
    isLoading.value = false;
    content.value = "";
  }
};
</script>
