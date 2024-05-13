<template>
  <div class="bg-[url('/bg.jpg')] dark:bg-[url('/darkbg.jpg')] min-h-screen bg-fixed">
    <Header />
    <UContainer class="flex flex-col items-center justify-center">
      <div class="p-4 w-full md:w-1/2">
        <div class="userpost">
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
              <div class="w-14 h-14 rounded-full bg-gray-300"></div>
            </div>
            <div class="w-full">
              <UTextarea
                color="primary"
                variant="outline"
                placeholder="Share with community..."
              />
            </div>
            <div>
              <UButton>Post</UButton>
            </div>
          </div>
        </div>
        <!-- Display all posts inside the "flood" div -->
      
      </div>
      <div class="flex items-center justify-center ">
       
  
        <ul class="flex flex-col items-stretch gap-4 overflow-x-auto max-w-full md:w-2/3 py-3">
          <li v-for="post in posts "
          :key="post.id"
          class="rounded-lg px-2"
          > 
          <PostCard
          :userName= "post.userName"
          :userImage="post.userImage"
          :likes=" post.likes"
          :postText=" post.postText"
          />
          </li>
        </ul>
  </div>
    </UContainer>
    
  </div>
</template>

<script setup>


const user = useSupabaseUser();

const posts = ref([
  {
    id: 1,
    userName: 'JohnDoe',
    postText: 'Just finished my morning workout feeling energized! 💪 #MotivationMonday',
    likes: 10,
    userImage: 'https://avatar.iran.liara.run/public/10'
  },
  {
    id:2,
    userName: 'JaneSmith',
    postText: 'Believe you can and you\'re halfway there. Keep pushing forward! #PositiveVibes',
    likes: 15,
    userImage: 'https://avatar.iran.liara.run/public/96'
  },
  {
    id:3,
    userName: 'MotivationMaster',
    postText: 'Success is not final, failure is not fatal: It is the courage to continue that counts. #StayMotivated',
    likes: 20,
    userImage: 'https://avatar.iran.liara.run/public/11'
  },
  {
    id:4,
    userName: 'EmpowermentGuru',
    postText: 'The only limit to our realization of tomorrow will be our doubts of today. Stay focused and positive! #Empowerment',
    likes: 25,
    userImage: 'https://avatar.iran.liara.run/public/12'
  },
  
  {
    id:5,
    userName: 'MindfulSoul',
    postText: 'Every accomplishment starts with the decision to try. Keep pushing forward! #Mindfulness',
    likes: 30,
    userImage: 'https://avatar.iran.liara.run/public/80'
  },
  {
    id:46,
    userName: 'StrengthInHeart',
    postText: 'Your hardest times often lead to the greatest moments of your life. Keep going. Tough situations build strong people! #Strength',
    likes: 35,
    userImage: 'https://avatar.iran.liara.run/public/14'
  },
  {
    id:7,
    userName: 'PositiveVibesOnly',
    postText: 'Surround yourself with positive people who believe in your dreams, encourage your ideas, support your ambitions, and bring out the best in you. #Positivity',
    likes: 40,
    userImage: 'https://avatar.iran.liara.run/public/60'
  },
  {
    id: 8,
    userName: 'DreamCatcher',
    postText: 'Follow your dreams, they know the way. #DreamBig',
    likes: 5,
    userImage: 'https://avatar.iran.liara.run/public/92'
  },
  {
    id: 9,
    userName: 'InspirationStation',
    postText: 'Inspiration is the wind beneath the wings of creativity. Keep soaring! #Inspiration',
    likes: 12,
    userImage: 'https://avatar.iran.liara.run/public/51'
  },
  {
    id: 10,
    userName: 'CourageousHeart',
    postText: 'Courage doesn\'t mean you don\'t get afraid. It means you don\'t let fear stop you. #Courage',
    likes: 22,
    userImage: 'https://avatar.iran.liara.run/public/80'
  },
  {
    id: 11,
    userName: 'SuccessSeeker',
    postText: 'Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful. #Success',
    likes: 28,
    userImage: 'https://avatar.iran.liara.run/public/42'
  },
  {
    id: 12,
    userName: 'OptimisticMindset',
    postText: 'Your positive action combined with positive thinking results in success. Stay optimistic! #Optimism',
    likes: 33,
    userImage: 'https://avatar.iran.liara.run/public/66'
  },
  {
    id: 13,
    userName: 'HopefulDreamer',
    postText: 'Hope is the dream of a waking man. Keep dreaming and keep hoping! #Hope',
    likes: 38,
    userImage: 'https://avatar.iran.liara.run/public/54'
  },
 
]);

const userImage = computed(() => user.value?.user_metadata?.picture);
</script>

<style scoped>
.post {
  padding: 10px;
  border-bottom: 1px solid #ccc;
}
</style>
