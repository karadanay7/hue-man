export default defineAppConfig({
  ui: {
   primary: 'green',
   gray: 'slate',

    card: {
      background: 'bg-[#FFF5F1] dark:bg-emerald-950',
      divide: "divide-y divide-gray-200 dark:divide-gray-600",
      ring: "ring-1 ring-green-600 dark:ring-gray-700",

      shadow: "shadow-lg  shadow-gray-400 dark:shadow-gray-800 dark:shadow-lg",
      header: {
        padding: "px-4 py-3 sm:px-6",
      },
    },
    badge: {
      size: {
        xl: "text-lg px-5 py-1.5",
      },
    },
    modal: {
      container: "flex min-h-full items-center justify-center text-center",
    },
    carousel:{
      indicators: {
        wrapper: ' flex items-center justify-center gap-3 bottom-0 inset-x-0',
        base: 'rounded-full h-3 w-3',
        active: 'bg-primary-500 dark:bg-primary-400',
        inactive: 'bg-gray-100 dark:bg-gray-800 mix-blend-overlay',
      },
    }
  
  },
});
