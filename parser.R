require(xmlconvert)
require(xml2)
require(XML)
require(flatxml)
require(openxlsx)
require(readxl)
require(htmltools)

# generate a mock data set

df <- data.frame(hersteller = c("",""), melder = c('Swissmedic', 'EMA'), strasse = c('Hallerstrasse', 'Berlinale'), nr = c(12,16))

df_test <- xml_to_df(file = 'documents/beispiel_evelyn.xml', first_records = NULL, records.tags = 'FONoti_MDR')

xml_test <- df_to_xml(df, fields = "tags", xml.file = 'test_file.xml')

xml_test <- xml_add_sibling(xml_test, 'new_child',.where = "after", .copy = TRUE)

write_xml(xml_test, 'new_test_file.xml')

tt = xmlHashTree(xml_test)

write.xlsx(df_test, 'new_file.xlsx')

df_new <- read_excel('new_file.xlsx')

xml_test <- df_to_xml(df_new, fields = "tags", xml.file = 'test_file2.xml')
