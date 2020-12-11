<template>
  <div id="home">
    <b-row>
      <b-col>
        <b-form-group label-cols="3" label-cols-xl="1" label-cols-lg="1" label-cols-md="2" label-size="lg" label="网络:" label-for="select-network">
          <b-form-select id="select-network" v-model="select_network" :options="networks" disabled></b-form-select>
        </b-form-group>
        <hr>
      </b-col>
    </b-row>
    <b-row>
      <b-col xl="3" lg="4" md="12">
        <b-form-group label-cols="3" label-cols-xl="3" label-cols-lg="3" label-cols-md="2"  label-size="lg" label="类别:" label-for="select-genre">
          <b-form-select id="select-genre" v-model="select_genre" :options="genres"></b-form-select>
        </b-form-group>
      </b-col>
      <b-col xl="6" lg="8" md="12">
        <b-form-group label-cols="3" label-cols-xl="2" label-cols-lg="2"  label-cols-md="2" label-size="lg" label="文件:" label-for="select-file">
          <b-form-select id="select-file" v-model="select_file" :options="files"></b-form-select>
        </b-form-group>
      </b-col>
      <b-col xl="3" lg="12" md="12">
        <b-form-group label-cols="3" label-cols-xl="3" label-cols-lg="1" label-cols-md="2" label-size="lg" label="通道:" label-for="select-vod">
          <b-form-select id="select-vod" v-model="select_vod" :options="vods"></b-form-select>
        </b-form-group>
      </b-col>
    </b-row>
  </div>
</template>
<script>
  export default {
    name: 'home',
    data(){
      return {
        networks:[
          {
            "text":"免费网络 - IPFS",
            "value":"ipfs"
          },
          {
            "text":"支付网络 - FileCache",
            "value":"filecash"
          },
          {
            "text":"支付网络 - FileCoin",
            "value":"filecoin"
          },
        ],
        select_network: null,
        genres:[],
        select_genre: null,
        files:[],
        select_file: null,
        vods:[],
        select_vod: null,
      }
    },
    methods:{
      async init(){
        this.select_network = this.networks[0].value;
      },
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
</style>
