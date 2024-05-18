<template>
  <div>
    <!-- Header component -->
    <Header></Header>

    <UContainer class="flex flex-col items-center justify-center overflow-hidden">
      <!-- Create a new post section -->
      <div class="p-4 w-full md:w-1/2">
        <div class="userpost flex items-center gap-2">
          <div>
            <!-- Placeholder for user image -->
            <div class="w-14 h-14 rounded-full bg-[#FFF5F1]"></div>
          </div>
          <div class="w-full">
            <UTextarea
              v-model="content"
              color="primary"
              variant="outline"
              placeholder="Share with community..."
            />
          </div>
          <div>
            <!-- Button to add a new post -->
            <UButton @click="onAddPost">Post</UButton>
          </div>
        </div>
      </div>

      <!-- Display all posts -->
      <div class="w-full lg:w-2/3 ">
        <div v-if="posts"  > 
        
        <ul class=" flex flex-col gap-3">
          <li v-for="post in posts" :key="post.id" class="rounded-lg px-2 ">
            <!-- PostCard component to display each post -->
            <PostCard
              :userName="post.username"
              :likes="post.likes"
              :content="post.content"
              :createdAt="post.createdAt"
             
            />
          </li>
        </ul>
      </div>
      <div v-else>nothing to display</div>
      </div>
     
    

     
    </UContainer>
  </div>
</template>

<script setup>

const user = useSupabaseUser();
const router = useRouter();

const userId = user.value.id;
const postsResponse = await useFetch("/api/prisma/get-all-posts");
const posts = computed(()=> postsResponse?.data.value);

const isLoading = ref(false); // Assuming you have isLoading ref
const content = ref("");
console.log(userId);
const onAddPost = async () => {
  isLoading.value = true;


  const requestBody = {
    userId: userId, // Assuming you have userId available
    content: content.value,
    // Add other fields as needed
  };

  try {
    // Make a POST request to your backend API endpoint
    const response = await fetch("/api/prisma/add-post/", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(requestBody),
    });

    if (response.ok) {
      router.push("/community"); // Redirect to the community page after adding the post
    } else {
      console.error("Failed to add post");
    }
  } catch (error) {
    console.error("Error occurred while adding post:", error);
  } finally {
    isLoading.value = false;
    content.value ="";
  }
};

 
</script>

<style scoped>
/* Add your scoped styles here */
.post {
  padding: 10px;
  border-bottom: 1px solid #ccc;
}
</style>
