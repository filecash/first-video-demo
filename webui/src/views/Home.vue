<template>
  <div id="home">
    <b-row>
      <b-col>
        <b-form-group label-cols="3" label-cols-xl="1" label-cols-lg="1" label-cols-md="2" label-size="lg" label="网络:" label-for="select-network">
          <b-form-select id="select-network" v-model="select_network" :options="networks"></b-form-select>
        </b-form-group>
        <hr>
      </b-col>
    </b-row>
    <b-row>
      <b-col xl="3" lg="4" md="12">
        <b-form-group label-cols="3" label-cols-xl="3" label-cols-lg="3" label-cols-md="2"  label-size="lg" label="类别:" label-for="select-genre">
          <b-form-select id="select-genre" v-model="select_genre" :options="genres" @change="change_genre"></b-form-select>
        </b-form-group>
      </b-col>
      <b-col xl="6" lg="8" md="12">
        <b-form-group label-cols="3" label-cols-xl="2" label-cols-lg="2"  label-cols-md="2" label-size="lg" label="文件:" label-for="select-file">
          <b-form-select id="select-file" v-model="select_file" :options="files" @change="change_files" :disabled="disabled_file"></b-form-select>
        </b-form-group>
      </b-col>
      <b-col xl="3" lg="12" md="12">
        <b-form-group label-cols="3" label-cols-xl="3" label-cols-lg="1" label-cols-md="2" label-size="lg" label="通道:" label-for="select-vod">
          <b-form-select id="select-vod" v-model="select_vod" :options="vods" @change="change_vod" :disabled="disabled_vod"></b-form-select>
        </b-form-group>
      </b-col>
    </b-row>
    <b-row>
      <b-col>
        <div style="width:100%">
        <video id="player" :poster="cover" controls autoplay class="video-js vjs-big-play-centered">
        </video>
        </div>
      </b-col>
    </b-row>
  </div>
</template>
<script>
import videojs from 'video.js'
  export default {
    name: 'home',
    data(){
      return {
        networks:[
          {
            text: "免费网络 - IPFS",
            value: "ipfs"
          },
          {
            text: "支付网络 - FileCache",
            value: "filecash",
            disabled: true
          },
          {
            text: "支付网络 - FileCoin",
            value: "filecoin",
            disabled: true
          },
        ],
        select_network: null,
        genres:[],
        select_genre: null,
        files:[],
        select_file: null,
        disabled_file: true,
        vods:[
          {"text":"local GW","value":"local"},
          {"text":"FileCash GW","value":"http://proofs.file.cash:8080"},
          {"text":"ipfs.io","value":"https://ipfs.io"},
        ],
        select_vod: null,
        disabled_vod: true,
        cover:""
      }
    },
    methods:{
      async init(){
        this.select_network = this.networks[0].value;

        let demo = await this.$axios.get('./demo_data.json').then((res)=>{
          return res.data.data
        })
        for (const demoKey in demo) {
          this.genres.push({
            "text":demo[demoKey]['title'],
            "value":demo[demoKey]['name'],
          })
        }
      },
      async change_genre(){
        let demo = await this.$axios.get('./demo_'+this.select_genre+'.json').then((res)=>{
          return res.data.data
        })
        this.files = []
        for (const demoKey in demo) {
          this.files.push({
            "text":demo[demoKey]['title'],
            "value":demo[demoKey]['url'],
          })
        }
        this.disabled_file = false;
        this.disabled_vod = true;
        this.select_vod = null;
      },
      async change_files(){
        this.disabled_vod = false;
        this.select_vod = null;
      },
      async change_vod(){
        let url = this.select_vod === 'local' ? this.select_file : this.select_vod + this.select_file;
        const sources = [{
          type:"video/mp4",
          src:url
        }];
        const player = videojs('player');
        player.ready(function(){
          const obj  = this;
          obj.src(sources);
          obj.load();
        });
        console.log(url);
      }
    },
    created() {
      this.init()
    },
  }
</script>
<style>
#home{
  padding-top: 15px;
}
#player{
  width: 100%;
  height: 60vh;
}
</style>
