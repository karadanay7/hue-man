<template>

  <UContainer>
    <div class="flex flex-col items-center justify-center  gap-3  pl-10">
      <div v-if="user" class=" flex items-center justify-center  w-full lg:w-2/3 ">
        <div class="m-4 items-center w-full flex gap-2 ">
          <div>
            <img class="h-14 w-14 rounded-full" src="https://static.vecteezy.com/system/resources/previews/002/002/257/non_2x/beautiful-woman-avatar-character-icon-free-vector.jpg" alt="">
          </div>
          <div class="flex-grow">
            <UTextarea v-model="content" color="primary" variant="outline" placeholder="Share with community..." />
          </div>
          <div>
            <!-- Button to add a new post -->
            <UButton @click="onAddPost">Post</UButton>
          </div>
        </div>
      </div>
      <div v-else>
        <div class="p-4 md:w-1/2">
          <p>Login to Share</p>
        </div>
      </div>

      <!-- Display all posts -->
      <div class="w-full lg:w-2/3">
        <div v-if="posts && posts.length">
          <ul class="flex flex-col gap-3">
            <li v-for="post in posts" :key="post.id" class="rounded-lg px-2">
              <!-- PostCard component to display each post -->
              <PostCard :userName="post.username" :likes="post.likes" :content="post.content" :createdAt="post.createdAt" />
            </li>
          </ul>
        </div>
        <div v-else>
          <p>Nothing to display</p>
        </div>
      </div>
    </div>
  </UContainer>

</template>




<script setup lang="ts">


const user = useSupabaseUser();
const toast = useToast();

onMounted(() => {
  if (!user.value) {
    AddLoginToPostToaster();
  }
});

const AddLoginToPostToaster = () => {
  toast.add({
    id: 'login_required',
    title: 'Login Required',
    description: 'You need to be logged in to create a post.',
    icon: 'i-octicon-desktop-download-24',
    timeout: 10000,
    actions: [{
      label: 'Login',
      click: () => {
        router.push('/login');
      }
    }]
  });
};
const AddPostSuccesfulToast = () => {
  toast.add({
    id: 'post_successful',
    title: 'Post Successful',
    description: 'Your post has been added successfully.',
    icon: 'i-octicon-check-circle-24',
    timeout: 1000
  });
};

const userId = computed(() => user.value?.id);
const postsResponse = await useFetch("/api/prisma/get-all-posts");
const posts = ref([]);

posts.value = postsResponse.data?.value.sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime()) ?? [];


const isLoading = ref(false);
const content = ref("");

const onAddPost = async () => {
  isLoading.value = true;

  const requestBody = {
    userId: userId.value,
    content: content.value
  };

  try {
    const response = await fetch("/api/prisma/add-post/", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(requestBody),
    });

    if (response.ok) {
      AddPostSuccesfulToast();
      const newPostResponse = await response.json();
      const newPost = JSON.parse(newPostResponse.body);
      posts.value.unshift({
        id: newPost.id,
        content: newPost.content,
        username: newPost.username,
        likes: [], // Assuming you have a property for likes
        createdAt: newPost.createdAt,
        // Add other properties as needed
      });
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
