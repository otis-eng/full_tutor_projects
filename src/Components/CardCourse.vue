<template lang="">
  <div>
    <div class="card">
    <img src="https://res.cloudinary.com/phankieuphuicloud/image/upload/v1625397788/imgAvatar/27a62b61138de7d3be9c4_yjaec4.jpg"   width="200" height="200" >
    <p class="card__name">{{item.name}}</p>
    <div class="grid-container">

      <div class="grid-child-posts">
        Description: {{item.description}}
      </div>

      <div class="grid-child-followers">
        Price: {{item.price}}
      </div>

    </div>
    <ul class="social-icons">
      <li><a href="#"><i class="fa fa-instagram"></i></a></li>
      <li><a href="#"><i class="fa fa-twitter"></i></a></li>
      <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
      <li><a href="#"><i class="fa fa-codepen"></i></a></li>
    </ul>
    <button  type="submit" class="btn draw-border" @click="registerCourse">Đăng Ký</button>
    
  </div>
    </div>
</template>
<script>
import axios from "axios";
export default {
    name:"CardCourse",

    props:{
      item:Object,
      user:String
    },
    methods: {
      async registerCourse(){
        const body ={
          "author":this.item.author,
          "student":this.user,
          "course":this.item.id,
        }
        await axios.post("http://homepagetutor.cleverapps.io/request/createRequest",body).then(()=>alert("Dang ky thanh cong")).catch((err)=>alert(err.message));
      }
    
    }
}
</script>
<style lang="scss">
    @import url("https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@400;500&display=swap");

.container {
  
  display: grid;
  grid-template-columns: 300px 300px 300px;
  grid-gap: 50px;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f5f5f5;
  font-family: 'Baloo Paaji 2', cursive;
}

.card {
  margin-top:10px ;
  background-color: #222831;
  height: 37rem;
  border-radius: 5px;
  display: flex;
  flex-direction: column;
  align-items: center;
  box-shadow: rgba(0, 0, 0, 0.7);
  color: white;
}

.card__name {
  margin-top: 15px;
  font-size: 1.5em;
}
img {
  border-radius: 50%;
}
.card__image {
  height: 160px;
  width: 160px;
  border-radius: 50%;
  border: 5px solid #272133;
  margin-top: 20px;
  box-shadow: 0 10px 50px rgba(235, 25, 110, 1);
}

.draw-border {
  box-shadow: inset 0 0 0 4px #58cdd1;
  color: #58afd1;
  -webkit-transition: color 0.25s 0.0833333333s;
  transition: color 0.25s 0.0833333333s;
  position: relative;

  &::before, &::after {
    border: 0 solid transparent;
    box-sizing: border-box;
    content: '';
    pointer-events: none;
    position: absolute;
    width: 0rem;
    height: 0;
    bottom: 0;
    right: 0;
  }

  &::before {
    border-bottom-width: 4px;
    border-left-width: 4px;
  }

  &::after {
    border-top-width: 4px;
    border-right-width: 4px;
  }

  &:hover {
    color: #ffe593;

    &::before, &::after {
      border-color: #eb196e;
      -webkit-transition: border-color 0s, width 0.25s, height 0.25s;
      transition: border-color 0s, width 0.25s, height 0.25s;
      width: 100%;
      height: 100%;
    }

    &::before {
      -webkit-transition-delay: 0s, 0s, 0.25s;
      transition-delay: 0s, 0s, 0.25s;
    }

    &::after {
      -webkit-transition-delay: 0s, 0.25s, 0s;
      transition-delay: 0s, 0.25s, 0s;
    }
  }
}

.btn {
  background: none;
  border: none;
  cursor: pointer;
  line-height: 1.5;
  font: 700 1.2rem 'Roboto Slab', sans-serif;
  padding: 0.75em 2em;
  letter-spacing: 0.05rem;
  margin: 1em;
  width: 13rem;

  &:focus {
    outline: 2px dotted #55d7dc;
  }
}

.social-icons {
  padding: 0;
  list-style: none;
  margin: 1em;

  li {
    display: inline-block;
    margin: 0.15em;
    position: relative;
    font-size: 1em;
  }

  i {
    color: #fff;
    position: absolute;
    top: 0.95em;
    left: 0.96em;
    transition: all 265ms ease-out;
  }

  a {
    display: inline-block;

    &:before {
      transform: scale(1);
      -ms-transform: scale(1);
      -webkit-transform: scale(1);
      content: " ";
      width: 45px;
      height: 45px;
      border-radius: 100%;
      display: block;
      background: linear-gradient(45deg, #ff003c, #c648c8);
      transition: all 265ms ease-out;
    }

    &:hover {
      &:before {
        transform: scale(0);
        transition: all 265ms ease-in;
      }

      i {
        transform: scale(2.2);
        -ms-transform: scale(2.2);
        -webkit-transform: scale(2.2);
        color: #ff003c;
        background: -webkit-linear-gradient(45deg, #ff003c, #c648c8);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        transition: all 265ms ease-in;
      }
    }
  }
}

.grid-container {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-gap: 20px;
  font-size: 1.2em;
}
</style>