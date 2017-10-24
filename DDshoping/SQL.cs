using System;
using System.Collections.Generic;
using System.Data;

using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace SQLTest
{
    class SQL
    {
        SqlConnection con = new SqlConnection();
        SqlCommand com;
        

        public  bool Connect()
        {
            try
            {
                con.ConnectionString = "Data Source=119.28.7.52; Initial Catalog = BookStore; User ID = 546715914; Password = 1996jo0609hn,.";
                con.Open();
                return true;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return false;
            }
        }

        public void Close()
        {
            con.Close();
        }

        public DataSet SendInfo(string str)
        {
            DataSet ds = new DataSet();
            try
            {
                com = new SqlCommand();
                com.Connection = con;
                com.CommandType = CommandType.Text;
                com.CommandText = str;
                SqlDataReader dr = com.ExecuteReader();//执行SQL语句
                ds = ConvertDataReaderToDataSet(dr);
                dr.Close();

                return ds;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return null;
            }
        }
        public DataSet ConvertDataReaderToDataSet(SqlDataReader reader)
        {
            DataSet dataSet = new DataSet();
            do
            {
                // Create new data table
                DataTable schemaTable = reader.GetSchemaTable();
                DataTable dataTable = new DataTable();
                if (schemaTable != null)
                {
                    // A query returning records was executed 
                    for (int i = 0; i < schemaTable.Rows.Count; i++)
                    {
                        DataRow dataRow = schemaTable.Rows[i];
                        // Create a column name that is unique in the data table 
                        string columnName = (string)dataRow["ColumnName"]; //+ " // Add the column definition to the data table 
                        DataColumn column = new DataColumn(columnName, (Type)dataRow["DataType"]);
                        dataTable.Columns.Add(column);
                    }
                    dataSet.Tables.Add(dataTable);
                    // Fill the data table we just created
                    while (reader.Read())
                    {
                        DataRow dataRow = dataTable.NewRow();
                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            dataRow[i] = reader.GetValue(i);
                        }
                        dataTable.Rows.Add(dataRow);
                    }
                }
                else
                {
                    // No records were returned
                    DataColumn column = new DataColumn("RowsAffected");
                    dataTable.Columns.Add(column);
                    dataSet.Tables.Add(dataTable);
                    DataRow dataRow = dataTable.NewRow();
                    dataRow[0] = reader.RecordsAffected;
                    dataTable.Rows.Add(dataRow);
                }
            }
            while (reader.NextResult());
            return dataSet;
        }
    }
}
