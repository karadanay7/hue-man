<template>
  

  <UContainer class="flex flex-col items-center justify-center ">
    <h1 class="text-center text-lg md:text-2xl text-green-600">
      Welcome to your Free-place...
    </h1>
    <p class="text-gray-400 text-xs md:text-sm w-full">
      Take a moment to reflect on your journey. How are you progressing towards
      your goals? What challenges have you encountered, and how did you overcome
      them? Feel free to share your thoughts, experiences, and any breakthroughs
      you've had along the way. This is your space to document and celebrate
      your personal growth.
    </p>
    <div class="p-4 w-full lg:w-1/2 ">
    
        <div class="flex items-center gap-2">
          <div v-if="user">
            <!-- Display the image -->
            <img src="https://static.vecteezy.com/system/resources/previews/002/002/257/non_2x/beautiful-woman-avatar-character-icon-free-vector.jpg" alt="userProfile" class="w-14 rounded-full" />
          </div>
          <div v-else>
            <!-- Placeholder if user or image not available -->
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
     
      <!-- Display all notes inside the "notes" div -->
     
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
