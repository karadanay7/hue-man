<template>
  <Header/>
  <div class="flex items-center justify-center  min-h-[calc(100vh-64px)]">
    <UContainer class="flex flex-col items-center justify-center">
    <QuotesCard
      v-if="currentQuote"
      :author="currentQuote.author"
      :quote="currentQuote.quote"
    />
    <div v-else>
      <p>No more quotes</p>
    </div>
    <div class="mt-20">
      <button @click="getNextQuote" class="bg-orange-400 hover:bg-pink-600 text-white font-bold py-2 px-4 rounded">
        Next Quote
      </button>
    </div>
  </UContainer>
  </div>
 
</template>


<script setup>




const quotes = [
  {
    id: 1,
    author: "Walt Disney",
    quote: "The way to get started is to quit talking and begin doing.",
    category: "motivational"
  },
  {
    id: 2,
    author: "Vince Lombardi",
    quote: "The only place where success comes before work is in the dictionary.",
    category: "motivational"
  },
  {
    id: 3,
    author: "Albert Einstein",
    quote: "Strive not to be a success, but rather to be of value.",
    category: "inspirational"
  },
  {
    id: 4,
    author: "Steve Jobs",
    quote: "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work.",
    category: "motivational"
  },
  {
    id: 5,
    author: "Nelson Mandela",
    quote: "It always seems impossible until it’s done.",
    category: "inspirational"
  },
  {
    id: 6,
    author: "Helen Keller",
    quote: "The only thing worse than being blind is having sight but no vision.",
    category: "inspirational"
  },
  {
    id: 7,
    author: "Maya Angelou",
    quote: "You will face many defeats in life, but never let yourself be defeated.",
    category: "motivational"
  },
  {
    id: 8,
    author: "Martin Luther King Jr.",
    quote: "The time is always right to do what is right.",
    category: "inspirational"
  },
  {
    id: 9,
    author: "Amelia Earhart",
    quote: "The most effective way to do it, is to do it.",
    category: "motivational"
  },
  {
    id: 10,
    author: "Theodore Roosevelt",
    quote: "Believe you can and you're halfway there.",
    category: "inspirational"
  },
  {
    id: 11,
    author: "Zig Ziglar",
    quote: "Your attitude, not your aptitude, will determine your altitude.",
    category: "motivational"
  },
  {
    id: 12,
    author: "Wayne Gretzky",
    quote: "You miss 100% of the shots you don’t take.",
    category: "motivational"
  },
  {
    id: 13,
    author: "Confucius",
    quote: "It does not matter how slowly you go as long as you do not stop.",
    category: "inspirational"
  },
  {
    id: 14,
    author: "Eleanor Roosevelt",
    quote: "The future belongs to those who believe in the beauty of their dreams.",
    category: "inspirational"
  },
  {
    id: 15,
    author: "Michael Jordan",
    quote: "I’ve missed more than 9000 shots in my career. I’ve lost almost 300 games. 26 times, I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life. And that is why I succeed.",
    category: "motivational"
  },
  {
    id: 16,
    author: "John F. Kennedy",
    quote: "Efforts and courage are not enough without purpose and direction.",
    category: "inspirational"
  },
  {
    id: 17,
    author: "Mark Twain",
    quote: "The secret of getting ahead is getting started.",
    category: "motivational"
  },
  {
    id: 18,
    author: "Oprah Winfrey",
    quote: "The biggest adventure you can take is to live the life of your dreams.",
    category: "inspirational"
  },
  {
    id: 19,
    author: "Jim Rohn",
    quote: "Either you run the day, or the day runs you.",
    category: "motivational"
  },
  {
    id: 20,
    author: "Ralph Waldo Emerson",
    quote: "Do not go where the path may lead, go instead where there is no path and leave a trail.",
    category: "inspirational"
  }
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
}


</script>

