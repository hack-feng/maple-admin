<template>
  <el-table
    :data="${table.entityPath}State.tableList"
    style="width: 100%">
    <#list table.fields as columnList>
      <#if columnList.propertyName != "id"
      && columnList.propertyName != "createId"
      && columnList.propertyName != "createName"
      && columnList.propertyName != "createTime"
      && columnList.propertyName != "updateId"
      && columnList.propertyName != "updateName">
        <#if columnList.propertyType == "Date">
          <el-table-column prop="${columnList.propertyName}" label="${columnList.comment}">
            <template slot-scope="scope">
              <div>
                {{plugins.changeDate(scope.row.${columnList.propertyName}, "yymmddhhmmss")}}
              </div>
            </template>
          </el-table-column>
        <#elseif columnList.propertyType == "Boolean">
          <el-table-column prop="${columnList.propertyName}" label="${columnList.comment}">
            <template slot-scope="scope">
              <el-link v-if="scope.row.${columnList.propertyName} === 0" >无效</el-link>
              <span v-else>正常</span>
            </template>
          </el-table-column>
        <#else>
          <el-table-column prop="${columnList.propertyName}" label="${columnList.comment}"></el-table-column>
        </#if>
      </#if>
    </#list>
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
