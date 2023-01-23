<script setup lang="ts">
import { ref, onMounted } from "vue";

let animDict = ref("");
let animName = ref("");
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
      </div>
      <div class="button">
        <button @click="play()" id="play">Play</button>
      </div>
    </div>
  </div>
</template>
