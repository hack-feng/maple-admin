package com.maple.demo.util;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.TemplateConfig;
import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.engine.AbstractTemplateEngine;
import com.baomidou.mybatisplus.generator.engine.VelocityTemplateEngine;
import com.sun.istack.internal.NotNull;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author ZhangFZ
 * @date 2021/4/7 9:36
 **/
public class GeneratorVue {
    private static final Logger logger = LoggerFactory.getLogger(GeneratorVue.class);

    /**
     * 配置信息
     */
    protected ConfigBuilder config;
    /**
     * 数据源配置
     */
    private DataSourceConfig dataSource;
    /**
     * 数据库表配置
     */
    private StrategyConfig strategy;
    /**
     * 模板 相关配置
     */
    private TemplateConfig template;

    /**
     * 配置信息
     */
    private ConfigBuilder configBuilder;

    private Configuration configuration;

    @NotNull
    private ConfigBuilder getConfigBuilder() {
        return configBuilder;
    }

    @NotNull
    private void setConfigBuilder(@NotNull ConfigBuilder configBuilder) {
        this.configBuilder = configBuilder;
    }

    /**
     * 构造方法
     *
     * @param dataSourceConfig 数据库配置
     * @since 3.5.0
     */
    GeneratorVue(@NotNull DataSourceConfig dataSourceConfig) {
        //这个是必须参数,其他都是可选的,后续去除默认构造更改成final
        this.dataSource = dataSourceConfig;
        configuration = new Configuration(Configuration.VERSION_2_3_23);
        configuration.setDefaultEncoding("UTF-8");
    }

    /**
     * 生成策略
     *
     * @param strategyConfig 策略配置
     * @return this
     * @since 3.5.0
     */
    GeneratorVue strategy(@NotNull StrategyConfig strategyConfig) {
        this.strategy = strategyConfig;
        return this;
    }

    /**
     * 指定模板配置
     *
     * @param templateConfig 模板配置
     * @return this
     * @since 3.5.0
     */
    public GeneratorVue template(@NotNull TemplateConfig templateConfig) {
        this.template = templateConfig;
        return this;
    }

    /**
     * 设置配置汇总
     *
     * @param configBuilder 配置汇总
     * @return this
     * @since 3.5.0
     */
    public GeneratorVue config(@NotNull ConfigBuilder configBuilder) {
        this.config = configBuilder;
        return this;
    }

    /**
     * 生成代码
     */
    void execute() {
        this.execute(null);
    }

    /**
     * 生成代码
     *
     * @param templateEngine 模板引擎
     */
    private void execute(AbstractTemplateEngine templateEngine) {
        logger.debug("==========================准备生成文件...==========================");
        // 初始化配置
        if (null == config) {
            config = new ConfigBuilder(null, dataSource, strategy, template, null);
        }
        if (null == templateEngine) {
            // 为了兼容之前逻辑，采用 Velocity 引擎 【 默认 】
            templateEngine = new VelocityTemplateEngine();
        }
        templateEngine.setConfigBuilder(config);
        // 模板引擎初始化执行文件输出
        setConfigBuilder(this.pretreatmentConfigBuilder(config));
        this.batchOutput();
        logger.debug("==========================文件生成完成！！！==========================");
    }

    /**
     * 预处理配置
     *
     * @param config 总配置信息
     * @return 解析数据结果集
     */
    @NotNull
    private ConfigBuilder pretreatmentConfigBuilder(@NotNull ConfigBuilder config) {
        return config;
    }

    public ConfigBuilder getConfig() {
        return config;
    }

    public TemplateConfig getTemplate() {
        return template;
    }

    @NotNull
    private void batchOutput() {
        try {
            List<TableInfo> tableInfoList = getConfigBuilder().getTableInfoList();
            System.out.println(JSONObject.toJSONString(tableInfoList));
            tableInfoList.forEach(tableInfo -> {
                String filePath = "D:"+ File.separator + "Vue" + File.separator  + tableInfo.getEntityName();
                String fileComponentsPath = "D:"+ File.separator + "Vue" + File.separator  + tableInfo.getEntityName() + File.separator+ "components";
                createPath(filePath);
                createPath(fileComponentsPath);
                outputIndex(tableInfo, filePath);
                outputTable(tableInfo, fileComponentsPath);
            });
        } catch (Exception e) {
            throw new RuntimeException("无法创建文件，请检查配置信息！", e);
        }
    }

    /**
     * 输出Index文件
     * @param tableInfo 表信息
     */
    private void outputIndex(@NotNull TableInfo tableInfo, String filePath) {
        String entityPath = "index.vue.ftl";
        this.freeMarkerRender(tableInfo, entityPath, filePath);
    }

    /**
     * 输出Table文件
     * @param tableInfo 表信息
     */
    private void outputTable(@NotNull TableInfo tableInfo,  String filePath) {
        String entityPath = "Table.vue.ftl";
        this.freeMarkerRender(tableInfo, entityPath, filePath);
    }

    /**
     * freemarker渲染html
     */
    private void freeMarkerRender(TableInfo tableInfo, String templateName, String filePath) {
        configuration.setClassForTemplateLoading(this.getClass(), "/templates/generator");
        String fileName = filePath + File.separator + templateName.replace(".ftl", "");
        if(!"index.vue.ftl".equals(templateName)){
            fileName = filePath + File.separator + tableInfo.getEntityName() + templateName.replace(".ftl", "");
        }
        Writer out = new StringWriter();
        try {
            // 获取模板,并设置编码方式
            Template template = configuration.getTemplate(templateName, "UTF-8");
            // step5 生成数据
            File docFile = new File(fileName);
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(docFile)));
            // 合并数据模型与模板
            // 将合并后的数据和模板写入到流中，这里使用的字符流
            Map<String, Object> map = new HashMap<>();
            map.put("table", tableInfo);
            template.process(map, out);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                out.flush();
                out.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    private void createPath(String filePath){
        File f = new File(filePath);
        if(f.mkdirs()){
            System.out.println(filePath + " --- createPath result");
        }
    }
}
