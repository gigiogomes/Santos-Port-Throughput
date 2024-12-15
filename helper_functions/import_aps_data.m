function data_table = import_aps_data()

file = 'APS_DADOS_ANUAIS.xlsx';
sheets = sheetnames(file);
raw_data = cell(length(sheets), 1);
data_table = table();

parfor i = 1:length(sheets)
    raw_data{i} = readtable(file, 'Sheet', sheets{i}, ...
        'VariableNamingRule', 'preserve');
    data_table = [data_table; raw_data{i}];
end


