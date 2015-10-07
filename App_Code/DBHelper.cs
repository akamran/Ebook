using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace MemorEbook.BL
{
    public class DefaultManager
    {
        #region core ***********************************************
        public enum DBReturnCode
        {
            SUCCESS = 0,
            CONNECTIONFAILURE = -1,
            SUCCESSNORESULT = -2,
            SUCCESSNOAFFECT = -3,
            DUPLICATEENTRY = -4,
            EXCEPTION = -5,
            INPUTPARAMETEREMPTY = -6
        }
        protected static SqlConnection OpenConnection()
        {
            SqlConnection conn = null;
            try
            {
                string pwd = ConfigurationManager.AppSettings["DBPassword"].ToString();
                string conStr = String.Format(ConfigurationManager.ConnectionStrings["MemorEbookCS"].ConnectionString, pwd);
                conn = new SqlConnection(conStr);
                conn.Open();
            }
            catch
            {
                conn = null;
            }
            return conn;
        }
        protected static void CloseConnection(SqlConnection conn)
        {
            try
            {
                conn.Close();
                conn.Dispose();
            }
            catch { }
        }
        public static DBReturnCode GetDataTable(string cmdTxt, out DataTable dtResult, params SqlParameter[] commandParameters)
        {
            dtResult = null;
            SqlConnection connection = OpenConnection();
            DBReturnCode retcode;
            if (connection == null)
            { retcode = DBReturnCode.CONNECTIONFAILURE; }
            else
            {
                try
                {
                    SqlCommand command = GetCommand(cmdTxt, connection, commandParameters);
                    SqlDataReader dr = command.ExecuteReader(CommandBehavior.CloseConnection);
                    dtResult = new DataTable();
                    dtResult.Load(dr);
                    if (dtResult.Rows.Count > 0)
                    { retcode = DBReturnCode.SUCCESS; }
                    else
                    { retcode = DBReturnCode.SUCCESSNORESULT; }
                }
                catch
                { retcode = DBReturnCode.EXCEPTION; }
                finally
                { CloseConnection(connection); }
            }
            return retcode;

        }
        public static DBReturnCode GetDataSet(string cmdTxt, out DataSet ds, params SqlParameter[] commandParameters)
        {
            ds = null;
            SqlConnection connection = OpenConnection();
            DBReturnCode retcode;
            if (connection == null)
            { retcode = DBReturnCode.CONNECTIONFAILURE; }
            else
            {
                try
                {
                    SqlCommand command = GetCommand(cmdTxt, connection, commandParameters);
                    command.CommandTimeout = 180;
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    ds = new DataSet(command.CommandText);
                    da.Fill(ds);
                    if (ds.Tables.Count > 0)
                    { retcode = DBReturnCode.SUCCESS; }
                    else
                    { retcode = DBReturnCode.SUCCESSNORESULT; }
                }
                catch
                { retcode = DBReturnCode.EXCEPTION; }
                finally
                { CloseConnection(connection); }
            }
            return retcode;
        }
        public static DBReturnCode ExecuteNonQuery(string cmdTxt, out int rows, params SqlParameter[] commandParameters)
        {
            SqlConnection connection = OpenConnection();
            DBReturnCode retcode;
            rows = 0;
            if (connection == null)
            { retcode = DBReturnCode.CONNECTIONFAILURE; }
            else
            {
                try
                {
                    SqlCommand command = GetCommand(cmdTxt, connection, commandParameters);
                    rows = command.ExecuteNonQuery();
                    if (rows < 1)
                    { retcode = DBReturnCode.SUCCESSNOAFFECT; }
                    else
                    { retcode = DBReturnCode.SUCCESS; }
                }
                catch
                { retcode = DBReturnCode.EXCEPTION; }
                finally
                { CloseConnection(connection); }
            }
            return retcode;
        }
        public static DBReturnCode ExecuteScalar(string cmdTxt, out object obj, params SqlParameter[] commandParameters)
        {
            SqlConnection connection = OpenConnection();
            DBReturnCode retcode;
            obj = null;
            if (connection == null)
            { retcode = DBReturnCode.CONNECTIONFAILURE; }
            else
            {
                try
                {
                    SqlCommand command = GetCommand(cmdTxt, connection, commandParameters);
                    obj = command.ExecuteScalar();
                    connection.Close();
                    retcode = DBReturnCode.SUCCESS;
                }
                catch
                { retcode = DBReturnCode.EXCEPTION; }
                finally
                { CloseConnection(connection); }
            }
            return retcode;
        }
        private static SqlCommand GetCommand(string cmdTxt, SqlConnection connection, params SqlParameter[] commandParameters)
        {
            SqlCommand command = new SqlCommand(cmdTxt, connection);
            if (cmdTxt.ToLower().StartsWith("usp_") || cmdTxt.ToLower().StartsWith("pr"))
                command.CommandType = CommandType.StoredProcedure;
            if (commandParameters != null)
                AttachParameters(command, commandParameters);
            return command;
        }
        private static void AttachParameters(SqlCommand command, SqlParameter[] commandParameters)
        {
            if (command == null) throw new ArgumentNullException("command");
            if (commandParameters != null)
            {
                foreach (SqlParameter p in commandParameters)
                {
                    if (p != null)
                    {
                        // Check for derived output value with no value assigned
                        if ((p.Direction == ParameterDirection.InputOutput ||
                            p.Direction == ParameterDirection.Input) &&
                            (p.Value == null))
                        {
                            p.Value = DBNull.Value;
                        }
                        command.Parameters.Add(p);
                    }
                }
            }
        }

        #endregion core
    }
}