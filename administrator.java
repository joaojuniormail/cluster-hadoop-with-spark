// ORM class for table 'administrator'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Fri Sep 20 10:24:16 BRT 2019
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class administrator extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("idadministrator", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        administrator.this.idadministrator = (Long)value;
      }
    });
    setters.put("name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        administrator.this.name = (String)value;
      }
    });
    setters.put("login", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        administrator.this.login = (String)value;
      }
    });
    setters.put("password", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        administrator.this.password = (String)value;
      }
    });
    setters.put("level", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        administrator.this.level = (Integer)value;
      }
    });
    setters.put("token", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        administrator.this.token = (String)value;
      }
    });
  }
  public administrator() {
    init0();
  }
  private Long idadministrator;
  public Long get_idadministrator() {
    return idadministrator;
  }
  public void set_idadministrator(Long idadministrator) {
    this.idadministrator = idadministrator;
  }
  public administrator with_idadministrator(Long idadministrator) {
    this.idadministrator = idadministrator;
    return this;
  }
  private String name;
  public String get_name() {
    return name;
  }
  public void set_name(String name) {
    this.name = name;
  }
  public administrator with_name(String name) {
    this.name = name;
    return this;
  }
  private String login;
  public String get_login() {
    return login;
  }
  public void set_login(String login) {
    this.login = login;
  }
  public administrator with_login(String login) {
    this.login = login;
    return this;
  }
  private String password;
  public String get_password() {
    return password;
  }
  public void set_password(String password) {
    this.password = password;
  }
  public administrator with_password(String password) {
    this.password = password;
    return this;
  }
  private Integer level;
  public Integer get_level() {
    return level;
  }
  public void set_level(Integer level) {
    this.level = level;
  }
  public administrator with_level(Integer level) {
    this.level = level;
    return this;
  }
  private String token;
  public String get_token() {
    return token;
  }
  public void set_token(String token) {
    this.token = token;
  }
  public administrator with_token(String token) {
    this.token = token;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof administrator)) {
      return false;
    }
    administrator that = (administrator) o;
    boolean equal = true;
    equal = equal && (this.idadministrator == null ? that.idadministrator == null : this.idadministrator.equals(that.idadministrator));
    equal = equal && (this.name == null ? that.name == null : this.name.equals(that.name));
    equal = equal && (this.login == null ? that.login == null : this.login.equals(that.login));
    equal = equal && (this.password == null ? that.password == null : this.password.equals(that.password));
    equal = equal && (this.level == null ? that.level == null : this.level.equals(that.level));
    equal = equal && (this.token == null ? that.token == null : this.token.equals(that.token));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof administrator)) {
      return false;
    }
    administrator that = (administrator) o;
    boolean equal = true;
    equal = equal && (this.idadministrator == null ? that.idadministrator == null : this.idadministrator.equals(that.idadministrator));
    equal = equal && (this.name == null ? that.name == null : this.name.equals(that.name));
    equal = equal && (this.login == null ? that.login == null : this.login.equals(that.login));
    equal = equal && (this.password == null ? that.password == null : this.password.equals(that.password));
    equal = equal && (this.level == null ? that.level == null : this.level.equals(that.level));
    equal = equal && (this.token == null ? that.token == null : this.token.equals(that.token));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.idadministrator = JdbcWritableBridge.readLong(1, __dbResults);
    this.name = JdbcWritableBridge.readString(2, __dbResults);
    this.login = JdbcWritableBridge.readString(3, __dbResults);
    this.password = JdbcWritableBridge.readString(4, __dbResults);
    this.level = JdbcWritableBridge.readInteger(5, __dbResults);
    this.token = JdbcWritableBridge.readString(6, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.idadministrator = JdbcWritableBridge.readLong(1, __dbResults);
    this.name = JdbcWritableBridge.readString(2, __dbResults);
    this.login = JdbcWritableBridge.readString(3, __dbResults);
    this.password = JdbcWritableBridge.readString(4, __dbResults);
    this.level = JdbcWritableBridge.readInteger(5, __dbResults);
    this.token = JdbcWritableBridge.readString(6, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeLong(idadministrator, 1 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeString(name, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(login, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(password, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(level, 5 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(token, 6 + __off, 12, __dbStmt);
    return 6;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeLong(idadministrator, 1 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeString(name, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(login, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(password, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(level, 5 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(token, 6 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.idadministrator = null;
    } else {
    this.idadministrator = Long.valueOf(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.name = null;
    } else {
    this.name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.login = null;
    } else {
    this.login = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.password = null;
    } else {
    this.password = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.level = null;
    } else {
    this.level = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.token = null;
    } else {
    this.token = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.idadministrator) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.idadministrator);
    }
    if (null == this.name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, name);
    }
    if (null == this.login) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, login);
    }
    if (null == this.password) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, password);
    }
    if (null == this.level) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.level);
    }
    if (null == this.token) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, token);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.idadministrator) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.idadministrator);
    }
    if (null == this.name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, name);
    }
    if (null == this.login) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, login);
    }
    if (null == this.password) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, password);
    }
    if (null == this.level) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.level);
    }
    if (null == this.token) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, token);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 1, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(idadministrator==null?"null":"" + idadministrator, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(name==null?"null":name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(login==null?"null":login, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(password==null?"null":password, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(level==null?"null":"" + level, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(token==null?"null":token, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(idadministrator==null?"null":"" + idadministrator, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(name==null?"null":name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(login==null?"null":login, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(password==null?"null":password, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(level==null?"null":"" + level, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(token==null?"null":token, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 1, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.idadministrator = null; } else {
      this.idadministrator = Long.valueOf(__cur_str);
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.name = null; } else {
      this.name = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.login = null; } else {
      this.login = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.password = null; } else {
      this.password = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.level = null; } else {
      this.level = Integer.valueOf(__cur_str);
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.token = null; } else {
      this.token = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.idadministrator = null; } else {
      this.idadministrator = Long.valueOf(__cur_str);
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.name = null; } else {
      this.name = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.login = null; } else {
      this.login = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.password = null; } else {
      this.password = __cur_str;
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.level = null; } else {
      this.level = Integer.valueOf(__cur_str);
    }

    if (__it.hasNext()) {
        __cur_str = __it.next();
    } else {
        __cur_str = "null";
    }
    if (__cur_str.equals("null")) { this.token = null; } else {
      this.token = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    administrator o = (administrator) super.clone();
    return o;
  }

  public void clone0(administrator o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("idadministrator", this.idadministrator);
    __sqoop$field_map.put("name", this.name);
    __sqoop$field_map.put("login", this.login);
    __sqoop$field_map.put("password", this.password);
    __sqoop$field_map.put("level", this.level);
    __sqoop$field_map.put("token", this.token);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("idadministrator", this.idadministrator);
    __sqoop$field_map.put("name", this.name);
    __sqoop$field_map.put("login", this.login);
    __sqoop$field_map.put("password", this.password);
    __sqoop$field_map.put("level", this.level);
    __sqoop$field_map.put("token", this.token);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
