<template>
  <el-table
    :data="${table.entityPath}State.tableList"
    style="width: 100%">
    <#list table.fields as columnList>
      <#if columnList.propertyName != "createId"
      and columnList.propertyName != "createName"
      and columnList.propertyName != "createTime"
      and columnList.propertyName != "updateId"
      and columnList.propertyName != "updateName">
        <#if columnList.propertyType == "Date">


        </#if>
      </#if>
    </#list>
    <el-table-column prop="account" label="用户名"></el-table-column>

    <el-table-column prop="createTime" label="创建时间">
      <template slot-scope="scope">
        <div>
          {{plugins.changeDate(scope.row.createTime, "yymmddhhmmss")}}
        </div>
      </template>
    </el-table-column>
    <el-table-column prop="status" label="状态">
      <template slot-scope="scope">
        <el-link
          v-if="scope.row.status === 0" >无效</el-link>
        <span v-else>正常</span>
      </template>
    </el-table-column>
  </el-table>
</template>

<script>
import { mapState } from "vuex";
export default {
  computed: {
    ...mapState({
      rootState: state => state,
      ${table.entityPath}State: state => state.${table.entityName}
    }),
  },
  data() {
    return {
    }
  }
}
</script>

<style scoped>

</style>
