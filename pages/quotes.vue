<template>
  
  <div class="flex items-center justify-center min-h-[calc(100vh-64px)]">
    <UContainer class="flex flex-col items-center justify-center">
      <div v-if="currentQuote" class="flex flex-col items-center rounded-3xl border-2 text-center justify-center">
        <div class="box">
          <span></span>
          <div class="flex flex-col content text-lg md:text-2xl font-quote mx-6">
            <p><Icon name="fe:quote-left" class="-mt-4" size="16" />{{ currentQuote.quote }}<Icon name="fe:quote-right" class="-mt-4" size="16" /></p>
            <p class="border-b inline-block text-lg">{{ currentQuote.author }}</p>
          </div>
        </div>
      </div>
      <div v-else>
        <p>No more quotes</p>
      </div>
      <div class="mt-20">
        <button @click="getNextQuote" class="bg-orange-400 border-2 border-red-400 dark:border-white hover:bg-rose-500 text-white font-bold py-2 px-4 rounded-lg">
          <p class="hover:scale-110">Next Quote</p>
        </button>
      </div>
    </UContainer>
  </div>
</template>

<script setup>
import { ref } from 'vue';

const quotes = [
  { id: 1, author: "Walt Disney", quote: "The way to get started is to quit talking and begin doing.", category: "motivational" },
  { id: 2, author: "Vince Lombardi", quote: "The only place where success comes before work is in the dictionary.", category: "motivational" },
  { id: 3, author: "Albert Einstein", quote: "Strive not to be a success, but rather to be of value.", category: "inspirational" },
  { id: 4, author: "Steve Jobs", quote: "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work.", category: "motivational" },
  { id: 5, author: "Nelson Mandela", quote: "It always seems impossible until it’s done.", category: "inspirational" },
  { id: 6, author: "Helen Keller", quote: "The only thing worse than being blind is having sight but no vision.", category: "inspirational" },
  { id: 7, author: "Maya Angelou", quote: "You will face many defeats in life, but never let yourself be defeated.", category: "motivational" },
  { id: 8, author: "Martin Luther King Jr.", quote: "The time is always right to do what is right.", category: "inspirational" },
  { id: 9, author: "Amelia Earhart", quote: "The most effective way to do it, is to do it.", category: "motivational" },
  { id: 10, author: "Theodore Roosevelt", quote: "Believe you can and you're halfway there.", category: "inspirational" },
  { id: 11, author: "Zig Ziglar", quote: "Your attitude, not your aptitude, will determine your altitude.", category: "motivational" },
  { id: 12, author: "Wayne Gretzky", quote: "You miss 100% of the shots you don’t take.", category: "motivational" },
  { id: 13, author: "Confucius", quote: "It does not matter how slowly you go as long as you do not stop.", category: "inspirational" },
  { id: 14, author: "Eleanor Roosevelt", quote: "The future belongs to those who believe in the beauty of their dreams.", category: "inspirational" },
  { id: 15, author: "Michael Jordan", quote: "I’ve missed more than 9000 shots in my career. I’ve lost almost 300 games. 26 times, I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life. And that is why I succeed.", category: "motivational" },
  { id: 16, author: "John F. Kennedy", quote: "Efforts and courage are not enough without purpose and direction.", category: "inspirational" },
  { id: 17, author: "Mark Twain", quote: "The secret of getting ahead is getting started.", category: "motivational" },
  { id: 18, author: "Oprah Winfrey", quote: "The biggest adventure you can take is to live the life of your dreams.", category: "inspirational" },
  { id: 19, author: "Jim Rohn", quote: "Either you run the day, or the day runs you.", category: "motivational" },
  { id: 20, author: "Ralph Waldo Emerson", quote: "Do not go where the path may lead, go instead where there is no path and leave a trail.", category: "inspirational" }
];

const currentQuoteIndex = ref(0);
const currentQuote = ref(quotes[currentQuoteIndex.value]);

const getNextQuote = () => {
  if (currentQuoteIndex.value < quotes.length - 1) {
    currentQuoteIndex.value++;
    currentQuote.value = quotes[currentQuoteIndex.value];
  } else {
    currentQuote.value = null;
  }
};
</script>

<style>
.box {
  position: relative;
  width: 400px;
  height: 300px;
  display: flex;
  justify-content: center;
  align-items: center;
  transition: 0.5s;
  z-index: 1;
}

.box::before {
  content: ' ';
  position: absolute;
  top: -30px;
  left: 100px;
  width: 50%;
  height: 120%;
  text-decoration: none;
  background: #fff;
  border-radius: 8px;
  transform: skewX(15deg);
  transition: 0.5s;
}

.box::after {
  content: '';
  position: absolute;
  top: 0;
  left: 50px;
  width: 50%;
  height: 100%;
  background: #fff;
  border-radius: 8px;
  transform: skewX(15deg);
  transition: 0.5s;
  filter: blur(30px);
}

.box:hover:before,
.box:hover:after {
  transform: skewX(0deg) scaleX(1.3);
}

.box:before,
.box:after {
  background: linear-gradient(315deg, #ffbc00, #ff0058)
}

.box span {
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 5;
  pointer-events: none;
}

.box span::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 0;
  height: 0;
  border-radius: 50px;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  opacity: 0;
  transition: 0.1s;
  animation: animate 2s ease-in-out infinite;
  box-shadow: 0 5px 15px rgba(0,0,0,0.08)
}

.box span::before {
  top: -40px;
  left: 40px;
  width: 50px;
  height: 50px;
  border-radius: 50px;
  opacity: 1;
}

.box span::after {
  content: '';
  position: absolute;
  bottom: 0;
  right: 0;
  width: 100%;
  height: 100%;
  border-radius: 50px;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  opacity: 0;
  transition: 0.5s;
  box-shadow: 0 5px 15px rgba(0,0,0,0.08);
  animation-delay: -1s;
}

.box span:after {
  bottom: -40px;
  right: 40px;
  width: 50px;
  border-radius: 50px;
  height: 50px;
  opacity: 1;
}

.box .content {
  position: relative;
  width: 400px;
  height: 254px;
  padding: 2px 20px;
  background: rgba(255, 255, 255, 0.05);
  backdrop-filter: blur(10px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
  z-index: 1;
  transition: 0.5s;
  color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
}

.box .content h2 {
  font-size: 20px;
  color: #fff;
  margin-bottom: 10px;
}
</style>
