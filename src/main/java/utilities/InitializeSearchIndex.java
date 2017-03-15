package utilities;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.IntField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;



public class InitializeSearchIndex {

	public static void main(String[] args) throws Exception{
		
		new InitializeSearchIndex();
		
	}
	
	public InitializeSearchIndex() throws Exception{
		
		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_47);
		IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_47, analyzer);
		Directory indexDir = FSDirectory.open(new File("$HOME/lucene/index/index"));
		IndexWriter index = new IndexWriter(indexDir, config);
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/betme", "betme", "betme");
		System.out.println("Indexing to directory '" + indexDir + "'...");
		indexBets(index, connection);
		index.close();
		connection.close();
		indexDir.close();
		System.out.println("Indexing completed");
    	
   	}
	
private void indexBets(IndexWriter index, Connection connection) throws Exception{
		
		Statement stmt = connection.createStatement();
		String sql = "select id, name, description, category, status from againsttheoperator";
		String sql2 = "select id, name, description, category, status from winwinforboth";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			Document doc = new Document();
			doc.add(new IntField("id", rs.getInt("id"), Field.Store.YES));
			doc.add(new TextField("name", rs.getString("name"), Field.Store.YES));
			doc.add(new TextField("description", rs.getString("description"), Field.Store.YES));
			doc.add(new TextField("category", rs.getString("category"), Field.Store.YES));
			doc.add(new TextField("status", rs.getString("status"), Field.Store.YES));
			
			index.addDocument(doc);
			System.out.println(rs.getString("name") + " indexed");
		}
		
		rs = stmt.executeQuery(sql2);
		
		while(rs.next()){
			Document doc = new Document();
			doc.add(new TextField("id", rs.getString("id"), Field.Store.YES));
			doc.add(new TextField("name", rs.getString("name"), Field.Store.YES));
			doc.add(new TextField("description", rs.getString("description"), Field.Store.YES));
			doc.add(new TextField("category", rs.getString("category"), Field.Store.YES));
			doc.add(new TextField("status", rs.getString("status"), Field.Store.YES));
			
			index.addDocument(doc);
			System.out.println(rs.getString("name") + " indexed");
		}
		
		rs.close();
		stmt.close();
		
	}
	
}
