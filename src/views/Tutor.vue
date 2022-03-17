<template lang="">
    <div v-if="isLoading == false">
        <div v-for="item in list">
            <CardTutor v-bind:item="item"/>  
        </div>
    </div>
    <div v-else>
        <div class="loader"></div>
    </div>

</template>
<script>
import axios from "axios";
import CardTutor from "../Components/TutorPage/CardProfile.vue"
export default {
    name:"Tutor",
    components:{
        CardTutor
    },
    data(){
        return{
            list:null,
            isLoading:false,
        }
    },
    async mounted() {
        await axios.get("http://homepagetutor.cleverapps.io/tutor/getAllTutor").then((response) =>this.list = response.data).catch(() =>{this.isLoading=true;})
    },
}
</script>
<style lang="scss">

.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite;

  /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% {
    -webkit-transform: rotate(0deg);
  }

  100% {
    -webkit-transform: rotate(360deg);
  }
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}
</style>