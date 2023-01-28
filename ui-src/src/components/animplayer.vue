<script setup lang="ts">
import { ref, onMounted } from "vue";

let animDict = ref("");
let animName = ref("");
let animFlag = ref();
let show = ref(false);

onMounted(() => {
  window.addEventListener("message", (event) => {
    let data = event.data;
    if (data.action == "show") {
      show.value = true;
    }
  });
  document.addEventListener("keydown", (event) => {
    if (event.keyCode == 27) {
      show.value = false;
      fetch(`https://elk-animplayer/close`, {
        method: "POST",
        body: JSON.stringify({}),
      }).then((resp) => {});
    }
  });
});

function play() {
  fetch(`https://elk-animplayer/playAnim`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json; charset=UTF8",
    },
    body: JSON.stringify({
      name: animName.value,
      dict: animDict.value,
      flag: animFlag.value,
    }),
  }).then((resp) => {});
}
</script>
<template>
  <div class="wrapper" v-if="show == true">
    <div class="container">
      <div class="title">
        <span>Animation Player</span>
      </div>
      <div class="animplayer">
        <div class="animDictionary animer">
          <span>Animation Dictionary</span>
          <input v-model="animDict" type="text" />
        </div>
        <div class="animationName animer">
          <span>Animation Name</span>
          <input v-model="animName" type="text" />
        </div>
        <div class="anim-flag animer">
          <span>Flag</span>
          <input class="animflaginput" v-model="animFlag" type="text" />
        </div>
      </div>
      <div class="button">
        <button @click="play()" id="play">Play</button>
      </div>
    </div>
  </div>
</template>

<style scoped>
.wrapper {
  width: 100vw;
  height: 100vh;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}

.container {
  width: 400px;
  height: auto;
  background: #2f3542f1;
  display: flex;
  flex-direction: column;
  align-items: centeR;
  gap: 20px;
  margin-left: 25%;
  border-radius: 5px;
  overflow: hidden;
  padding: 20px 0px;
}

.title {
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  font-size: 20px;
  color: rgba(255, 255, 255, 0.836);
}

.animplayer {
  display: flex;
  flex-direction: column;
  margin-top: 0%;
  background: #a4b0becc;
  height: fit-content;
  padding: 10px;
  border-radius: 5px;
}

.anim-flag {
  display: flex;
  gap: 10px;
}
.animflaginput {
  width: 50px !important;
}

.animDictionary {
  display: flex;
  justify-content: space-between;
  gap: 2vh;
}

.animationName {
  display: flex;
  justify-content: space-between;
  gap: 2vh;
  margin-top: 3%;
}

.animer span {
  font-size: 14px;
  color: rgba(255, 255, 255, 0.644);
}

.animer input {
  background: #747d8c;
  outline: none;
  border: none;
  border-radius: 3px;
  color: rgba(255, 255, 255, 0.473);
}

.button {
  width: 50px;
  height: 50px;
  margin-left: 20%;
}
.button button {
  width: 100px;
  height: 30px;
  color: rgba(238, 238, 238, 0.801);
  background: #a4b0bec0;
  border: none;
  border-radius: 3px;
}
.button button:hover {
  width: 100px;
  height: 30px;
  color: rgba(255, 255, 255, 0.801);
  background: #a4b0beda;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}
</style>
