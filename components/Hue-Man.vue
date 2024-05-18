<template>
    <div>
        <div class="stage text-8xl font-bold font-hueman  ">
          
  <div class="layer">  </div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
  <div class="layer"></div>
</div>
    </div>

</template>
<style>
* *, *::before, *::after { 
  animation-play-state: running !important;
}



.stage {
  height: 300px;
  width: 500px;
  margin: auto;
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  perspective: 9999px;
  transform-style: preserve-3d;
}

.layer {
  width: 100%;
  height: 100%;
  position: absolute;
  transform-style: preserve-3d;
  animation: textAnimation 5s infinite alternate ease-in-out;
  animation-fill-mode: forwards;
  transform: rotateY(10deg) rotateX(10deg) translateZ(0);
}

.layer:after {
 
  content: "Hue-Man";
  white-space: pre;
  text-align: center;
  height: 100%;
  width: 100%;
  position: absolute;

  color: whitesmoke;
  letter-spacing: 4px;
  text-shadow: 4px 0 10px rgba(0, 0, 0, 0.13);
}

.layer:nth-child(1):after { transform: translateZ(0px); }
.layer:nth-child(2):after { transform: translateZ(-1.5px); }
.layer:nth-child(3):after { transform: translateZ(-3px); }
.layer:nth-child(4):after { transform: translateZ(-4.5px); }
.layer:nth-child(5):after { transform: translateZ(-6px); }
.layer:nth-child(6):after { transform: translateZ(-7.5px); }
.layer:nth-child(7):after { transform: translateZ(-9px); }
.layer:nth-child(8):after { transform: translateZ(-10.5px); }
.layer:nth-child(9):after { transform: translateZ(-12px); }
.layer:nth-child(10):after { transform: translateZ(-13.5px); }
.layer:nth-child(11):after { transform: translateZ(-15px); }
.layer:nth-child(12):after { transform: translateZ(-16.5px); }
.layer:nth-child(13):after { transform: translateZ(-18px); }
.layer:nth-child(14):after { transform: translateZ(-19.5px); }
.layer:nth-child(15):after { transform: translateZ(-21px); }
.layer:nth-child(16):after { transform: translateZ(-22.5px); }
.layer:nth-child(17):after { transform: translateZ(-24px); }
.layer:nth-child(18):after { transform: translateZ(-25.5px); }
.layer:nth-child(19):after { transform: translateZ(-27px); }
.layer:nth-child(20):after { transform: translateZ(-28.5px); }

.layer:nth-child(n+10):after {
  -webkit-text-stroke: 3px rgba(0, 0, 0, 0.25);
}

.layer:nth-child(n+11):after {
  -webkit-text-stroke: 15px rgb(21, 105, 43);
  text-shadow: 6px 0 6px #03481b, 5px 5px 5px #03471d, 0 6px 6px #022d14;
}

.layer:nth-child(n+12):after {
  -webkit-text-stroke: 15px #081c0c;
}

.layer:last-child:after {
  -webkit-text-stroke: 17px rgba(0, 0, 0, 0.1);
}

.layer:first-child:after {
  color: #fff;
  text-shadow: none;
}

@keyframes textAnimation {
  0% {
    transform: rotateY(10deg) rotateX(10deg) scale(1);
  }
  50% {
    transform: rotateY(5deg) rotateX(5deg) scale(1.2);
  }
  100% {
    transform: rotateY(10deg) rotateX(10deg) scale(1);
  }
}
</style>
<script>


</script>

