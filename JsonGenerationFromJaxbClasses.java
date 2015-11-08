import com.fasterxml.jackson.module.jsonSchema.factories.SchemaFactoryWrapper;
import com.fasterxml.jackson.databind.AnnotationIntrospector;  
import com.fasterxml.jackson.databind.JsonMappingException;  
import com.fasterxml.jackson.databind.ObjectMapper;  
import com.fasterxml.jackson.databind.type.TypeFactory;  
import com.fasterxml.jackson.module.jaxb.JaxbAnnotationIntrospector;  
import com.fasterxml.jackson.core.JsonProcessingException;
  
  
import java.io.FileOutputStream;
import java.io.IOException;
import static java.lang.System.out;  
import static java.lang.System.err;  
  
/** 
 * Generates JavaScript Object Notation (JSON) from Java classes 
 * with Java API for XML Binding (JAXB) annotations. 
 */  
public class JsonGenerationFromJaxbClasses  
{  

/** 
 * Write out JSON Schema based upon Java source code in 
 * class whose fully qualified package and class name have 
 * been provided. This method uses the newer module JsonSchema 
 * class that replaces the deprecated databind JsonSchema. 
 * 
 * @param fullyQualifiedClassName Name of Java class upon 
 *    which JSON Schema will be extracted. 
 */  
private void writeToStandardOutputWithModuleJsonSchema(
   final String [] fullyQualifiedClassName)  
{  
      for (int i = 0; i < fullyQualifiedClassName.length; i++) {
		// catch an error on each file and continue
	      try {
		      final ObjectMapper mapper = this.createJaxbObjectMapper();  
		      final SchemaFactoryWrapper visitor = new SchemaFactoryWrapper();  
		      mapper.acceptJsonFormatVisitor(mapper.constructType(Class.forName(fullyQualifiedClassName[i])), visitor);  
		      final com.fasterxml.jackson.module.jsonSchema.JsonSchema jsonSchema = visitor.finalSchema();  
		      String schema = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonSchema);  
		      FileOutputStream fos = new FileOutputStream(fullyQualifiedClassName[i]+".json");
		      fos.write(schema.getBytes(), 0, schema.getBytes().length);
		      // out.println(fullyQualifiedClassName[i]);
		}  catch (ClassNotFoundException cnfEx)  {  
		      err.println("Unable to find class " + fullyQualifiedClassName);  
		      cnfEx.printStackTrace();
		}  catch (JsonProcessingException jsonEx)  {  
		      err.println("Unable to process JSON: " + jsonEx);  
		} catch (IOException ioEx)  {  
		      err.println("Can't write to file "+fullyQualifiedClassName[i]+": " + ioEx);  
		}
      }
}  

   /** 
    * Create instance of ObjectMapper with JAXB introspector 
    * and default type factory. 
    * 
    * @return Instance of ObjectMapper with JAXB introspector 
    *    and default type factory. 
    */  
   private ObjectMapper createJaxbObjectMapper()  
   {  
      final ObjectMapper mapper = new ObjectMapper();  
      final TypeFactory typeFactory = TypeFactory.defaultInstance();  
      final AnnotationIntrospector introspector = new JaxbAnnotationIntrospector(typeFactory);  
      // make deserializer use JAXB annotations (only)  
      mapper.getDeserializationConfig().with(introspector);  
      // make serializer use JAXB annotations (only)  
      mapper.getSerializationConfig().with(introspector);  
      return mapper;  
   }  
  
   /** 
    * Accepts the fully qualified (full package) name of a 
    * Java class with JAXB annotations that will be used to 
    * generate a JSON schema. 
    * 
    * @param arguments One argument expected: fully qualified 
    *     package and class name of Java class with JAXB 
    *     annotations. 
    */  
   public static void main(final String[] arguments)  
   {  
      if (arguments.length < 1)  
      {  
         err.println("Need to provide the fully qualified name of the highest-level Java class with JAXB annotations.");  
         System.exit(-1);  
      }  
      final JsonGenerationFromJaxbClasses instance = new JsonGenerationFromJaxbClasses();  
      final String [] fullyQualifiedClassName = arguments;  
      instance.writeToStandardOutputWithModuleJsonSchema(fullyQualifiedClassName);  
   }  
}  
