<template>
  <div>
    <${table.entityName}Table
            ref="TableArea"
            @getTableList="getTableList">
    </${table.entityName}Table>
  </div>
</template>

<script>
  import ${table.entityName}Edit from "./components/${table.entityName}Edit";
  import ${table.entityName}Search from "./components/${table.entityName}Search";
  import ${table.entityName}Table from "./components/${table.entityName}Table";
  import { mapState } from "vuex";

  export default {
    name: "index",
    computed:{
      ...mapState({
        rootState: state=>state,
        ${table.entityPath}State: state=>state.${table.entityName}
  })
  },
  components: {
    ${table.entityName}Edit, ${table.entityName}Search, ${table.entityName}Table
  },
  created(){ this.getTableList(); },
  methods: {
    getTableList(current) {
      if (current) this.rootState.current = current;
      this.api.post("/${table.entityPath}/getList?current=" + this.rootState.current + "&size=" + this.rootState.size, this.${table.entityPath}State.searchForm).then((res) => {
        if (res.code === 200) {
        this.${table.entityPath}State.tableList = res.data.records;
        console.log(res.data.records)
        this.rootState.total = res.data.total;
        this.$store.dispatch("ROOT_UPDATE_TABLE_HEIGHT", {$}); // 动态设置表格高度
      }
    });
    },
  }
  }

</script>

<style scoped>

</style>
