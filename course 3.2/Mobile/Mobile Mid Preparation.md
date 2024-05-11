# S1
- **singleton** - object
- **lazy property** - some value of variable is calculated only when it is called
- **lateint** - no value when instance of class is created
# S2
![[software stack.png]]
- Android is by Google
	- some companies customized it, forked it
- **Hardware Abstraction Layer (HAL)** - it exposes hardware to Java. For example, Camere Library that helps communicating between Camera harware and Java or C/C++. 
- Each app runs in its own process with its own instance of **Android Runtime (ART)**
- **Java** allows creating app
	- with UI - **View System**
	- **Resource Manager** - non code files: images, strings, layout files
	- **Notification Manager** - custom alerts
	- **Activity Manager** - navigation of pages
	- **Content Provider** - getting data from other apps
- **Android Studio** to develop android apps
- **Gradle** - technology that converts code into apk (Android Application Package) or aab (Android App Bundle)
	- it is the one that builds application from your code
- **App Manifest** - every app has `AndroidManifest.xml` and it has essential information about your app:
	- activities, services, broadcast receivers, content providers.
	- permissions for an app
	- hardware and software requirements
- in `AndroidManifest.xml`:
	- `<activity>` - **Activities**, UI components, pages
	- `<service>` - **Services**, some background operations that do not require user interaction
	- `<receiver>` - **Broadcast Receivers**, gets some information from Android System itself, like battery level changes, network connectivity
	- `<provider>` - **Content Providers**, a way used by app to interact with other app's data
	- `<user-permission>` - **Permissions**, in that tag can be written that app wants access to SMS, or Camera or smth else.
		- if user grants permission, then Android unlocks usage of some system API to application, if does not grant, then app fails to use those APIs
	- `<uses-sdk>` and `<uses-feature>` is about compatibility
- **Activity** - is like an entry point to an app. 
	- Activity gives a window on which app draws UI, window may vary in size.
	- one activity - one screen/page
	- app can have multiple activities
	- one of them is main activity
	- one activity may launch another activity
		- even those activities may be from different apps
	- to use activity, the information about it should be in manifest file
	- it has lifecycle: `onCreate`, `onStart`, `onResume`,`onPause`,`onStop`,`onRestart`,`onDestroy` 
	  ![[activity lifecylce.png]]
- intent - messenger between app components. Intents facilitate communication and interaction between different components like activities, services, broadcast receivers, and content providers.
	- Example: `tel:123` allows launching contacts with the number and something
	- intent filters allows explicit and implicit requests
# S3
- **layouts** - is a UI part of activity. It can consist of **views** and **viewGroups**. 
	- **View** draws smth that user can interact with
		- **ViewGroup** is a container for other Views and ViewGroups
	- View can be called as widget
	- View can be from one of subclasses as *TextView* or *Button*
	- ViewGroup objects can be called layouts and it also can be from one of subclasses as  *LinearLayout* or *ConstraintLayout*
	- UI can be prepared in XML file. Android Studio also has a Layout Editor that helps creating UI visually.
		- using XML file, code part is seprated from UI part
		- you can choose screen different sizes and orientations
		- the layout file is saved into `res/layout/` 
		- its design is similar to HTML as it is hierarchical 
			- layout file should have root element (View or ViewGroup)
			- other widgets will be as child and will be nested inside
		- Example:
			```xml
			<?xml version="1.0" encoding="utf-8"?>
			<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
			android:layout_width="match_parent"
			android:layout_height="match_parent"
			android:orientation="vertical" >
			<TextView android:id="@+id/text"
			android:layout_width="wrap_content"
			android:layout_height="wrap_content"
			android:text="Hello, I am a TextView" />
			<Button android:id="@+id/button"
			android:layout_width="wrap_content"
			android:layout_height="wrap_content"
			android:text="Hello, I am a Button" />
			</LinearLayout>
			```
		- it is considered as XML Resource, and when code is run, this file also should be loaded. In code the file is called 
			```kotlin
			fun onCreate(savedInstanceState: Bundle) {
			super.onCreate(savedInstanceState)
			setContentView(R.layout.main_layout) 
			}
			```
- **Attributes**.  Things that are used by widgets. (string value for textView, for example)
	- View object must have id `android:id="@+id/my_button"`
	- Example:
		- in xml file
			```xml
			<Button android:id="@+id/my_button"
			android:layout_width="wrap_content"
			android:layout_height="wrap_content"
			android:text="@string/my_button_text"/>
			```
		- in code (in `onCreate` method)
			```kotlin
			val myButton: Button = findViewById(R.id.my_button)
			```
- Layout Parameters that are in `layout_something` passes to child elements of it.
	- size and position of each child view (or viewgroup)
	- (`layout_width` and `layout_height`) are in all view groups and determines width and height of element
		- `wrap_content` says that the view should have size required for content inside
		- `match_parent` says that the view should have size of its parent
		- it is not recommended to use pixels, instead **use density-independent pixel units (dp)**, `wrap_content`, or `match_parent`.
- Common Layouts
	- Linear(chidlren are placed into one horizontal or vertical row, and scroll bar is used), Relative(children are placed relatively to others, like A is on 5px left from B), Web (Web)
		- ![[layout 1.png]]
	- AdapterView allows having Grid and List Views.
		- ![[layout 2.png]]
- UI Components
	- Some of them are:
		- TextView - text
		- EditText - input
		- AutoCompleteTextView - input with auto complete
		- Button - Button
		- ImageButton - Button with image
		- CheckBox, ToggleButton, RadioButton, RadioGroup
		- ProgressBar, Spinner - information about processes that are going in background
		- TimePicker,  DatePicker
	- They can have different styles
- Constraint Layout is like RelativeLayout but easier to use and more flexible. It is built for using Layout Editor in Android Studio
	- you must add at least one horizontal and one vertical constraint for the view
	- view with no constraints are drawn at `[0,0]` 
	- enables relatively positioning, allignment with other views
	- **Guideline** is as invincible line to which views can be constrained
# S4
- **ListView**. Displays a vertically-scrollable collection of views, where each view is positioned immediately below the previous view in the list. 
	- Example
		```xml
		<ListView
		android:id="@+id/list_view"
		android:layout_width="match_parent"
		android:layout_height="match_parent"
		/>
		```
	- in code used: `setAdapter(android.widget.ListAdapter)`
- **RecyclerView**. efficiently display large sets of data. As view scrolled, some element is not destroyed, instead it is used to create new elements.
	- Key classes
		- RecyclerView displays dynamic lists.
		- It uses **view holders** to manage data for each list item.
		- An **adapter** binds data to view holders.
		- A **layout manager** arranges list items.
	- Steps for implementing
		- Design list/grid layout using built-in layout managers.
		- Create ViewHolder class for individual list items (extends `RecyclerView.ViewHolder`).
		- Define Adapter class to connect data with ViewHolder views (extends `RecyclerView.Adapter`).
	- **LayoutManager arranges items:** 
		- **LinearLayoutManager:** One-dimensional list, items with potentially different sizes.
		- **GridLayoutManager:** Two-dimensional grid, tries to maintain consistent item sizes within rows/columns.
		- **StaggeredGridLayoutManager:** Similar to GridLayoutManager but allows items in rows/columns to have different sizes, creating a staggered layout.
- **Adapter and view holder**. 
	- **ViewHolder:** Wraps an individual list item's view layout.
	- **Adapter:** Creates view holders and sets their data (binding).
	- **Binding:** The process of associating data with its corresponding view holder.
	- `onCreateViewHolder()`: Creates and initializes new view holders (without data).
	- `onBindViewHolder()`: Binds data to existing view holders (filling their content).
	- `getItemCount()`: Returns the total number of items in the data set.
- Terms
	- **Adapter**: A subclass of Adapter responsible for providing views that represent items in a data set.
	- **Position**: The position of a data item within an Adapter.
	- **Index**: The index of an attached child view as used in a call to `getChildAt`. Contrast with Position.
	- **Binding**: The process of preparing a child view to display data corresponding to a position within the adapter.
	- **RecyclerView optimizes performance:** It reuses views (Recycle & Scrap) to avoid expensive creation for similar data.
	- **Recycle:** Previously used views are cached for later reuse with the same data type.
	- **Scrap:** Temporarily detached views might be reused unmodified or updated by the adapter (if dirty).
	- **Dirty view:** Requires the adapter to update its data before being displayed again.
# S5
- Touch Gestures
	- app should accept Android for gesture conventions
- Input Events
	- events can be captured in dozens of way
	- View class provides a way to use events if a user interacts with some view
		- View class provides callback methods for common events like `onTouchEvent()`.
		- Extending every View for event handling is impractical.
		- Use event listener interfaces (nested within View class) for easier implementation.
	- You can extend View to define default event behavior for custom components, and make View fancier
- **Event listeners**. It waits for specific user actions (like clicks or touches) on a view, and then tells your code what happened so you can react to it.
	- `onClick()`, `onLongClick()`, `onTouch()`, `onKey()`
	- Choose the interface that matches the event you want to capture (e.g., `OnClickListener` for clicks).
	- Link your implementation to a view using a method like `setOnClickListener()`.
	- Define the code to execute when the event occurs (e.g., `onClick()` for button clicks).
	- You can either make your Activity implement the interface or create an anonymous class directly within the registration call.
- **Handling focus**. Focus jumps to the nearest neighbor in a specific direction.
	- Use XML attributes (`nextFocusDown`, `nextFocusUp`) to explicitly define the next focus target when focus leaves a view. Use `nextFocus*` attributes in the layout to define the next focus target when focus leaves a view.
	- Set `android:focusable` to `true` in the layout to enable focus for a view.
    - Set `android:focusableInTouchMode` to `true` to enable focus in touch mode.
    - Call `requestFocus()` on a view to request it to gain focus.
- **Sensors**. It is a built-in device component that **measures the surrounding environment or device state** (e.g., motion, temperature, orientation). 
	- Android supports: Motion sensors, Environmental sensors, Position sensors. Those are accessible by **Android sensor framework**.
	- **SensorManager:**
	    - Provides access and control over sensors.
	    - Lists available sensors, registers/unregisters listeners, acquires data, and offers calibration options.
	- **Sensor:**
	    - Represents a specific sensor (e.g., accelerometer, temperature).
	    - Provides methods to check its capabilities (range, resolution, etc.).
	- **SensorEvent:**
	    - Carries information about a sensor event:
	        - Raw data
	        - Sensor type
	        - Accuracy
	        - Timestamp
	- **SensorEventListener:**
	    - Interface for receiving notifications when sensor values or accuracy change.
	    - Implement its methods to handle sensor events.
	- **Identifying Sensors and Capabilities:**
		- Check available sensors and features at runtime.
		- Disable features based on missing sensors.
		- Choose optimal sensor implementations based on capabilities.
	- **Monitoring Sensor Events:**
		- Listen for sensor data changes through events.
		- Each event provides:
			- Sensor name
		    - Timestamp
		    - Accuracy
		    - Raw sensor data
	- Identifiying
		- **SensorManager:** Provides methods to access sensors and their capabilities.
			- **Get SensorManager instance:**
			    - Use `getSystemService(Context.SENSOR_SERVICE)`.
			- **Get all sensors:**
			    - Use `sensorManager.getSensorList(Sensor.TYPE_ALL)`.
		- **Use `getDefaultSensor()` method:**
		    - Pass the sensor type constant you want to check for (e.g., `Sensor.TYPE_MAGNETIC_FIELD`).
		- **Returns the default sensor:**
		    - If multiple of that type exist, one is designated as default.
		    - Returns `null` if the sensor type isn't present.
			```kotlin
			private lateinit var sensorManager: SensorManager
			...
			sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
			if (sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD) != null) {
				// Success! A magnetometer is present.
			} else {
				// No magnetometer available.
			}
			```
	- **Implementing SensorEventListener:**
		- Implement two callback methods:
		    - `onAccuracyChanged()`: Called when sensor accuracy changes (provides sensor and new accuracy).
		    - `onSensorChanged()`: Called when a new sensor value is reported (provides a SensorEvent object).
		- **Information in SensorEvent:**
			- Accuracy of the data
			- Sensor that generated the data
			- Timestamp of data generation
			- New sensor data
	- **Google Play filters**
		```xml
		<uses-feature
		android:name="android.hardware.sensor.accelerometer"
		android:required="true" />
		```
		- Use `<uses-feature>` element in manifest to filter apps by sensor availability.
	- Coordinate system. 
		- Standard 3-axis system: Used for sensor data representation.
		- **Based on device's default orientation (portrait):**
		    - X-axis: Horizontal, rightwards.
		    - Y-axis: Vertical, upwards.
		    - Z-axis: Towards the front of the screen (positive).
		    - Behind the screen: Negative Z values.
		- Applicable sensors: Accelerometer, Gravity sensor, Gyroscope, Linear acceleration sensor, Geomagnetic field sensor
	- Best Practices Summary:
		- **Gather data in the foreground:** Only collect sensor data when your app is actively visible or using a foreground service, especially on devices running Android 9 or later.
		- **Unregister listeners:** Unregister sensor listeners when you're done using the sensor or when the activity pauses to avoid unnecessary battery drain.
		- **Avoid blocking `onSensorChanged()`:** Keep this method as lean as possible to avoid performance issues. Process and filter data outside of this method.
		- **Verify sensors before use:** Always check if a sensor exists before using it, as device manufacturers may not include all sensors.
# S6
- **Sync** Programming. One thread goes, and then when the second thread activated, the first one waits. As the second ends, program returns to the first, and the first thread continues
- **Async** Programming
	- **Threading**. Creates separate threads of execution, allowing your main program to continue running while tasks run concurrently. However, managing threads can be complex and error-prone. It is expensive, there is limit to parallel threads, and has such problem as race condition and debugging
	- **Callbacks**. Functions passed to another function to be executed when an asynchronous operation completes. This can lead to "callback hell" with nested callbacks becoming difficult to manage. It is complex to handle errors.
	- **Future, Promises**. Represent the eventual result of an asynchronous operation. Futures provide access to the result once it's available, while Promises offer a more chained approach for handling the result.
	- **Reactive Extensions**. Declarative approach using streams of data and operators for handling asynchronous events. Offers powerful features but requires understanding reactive concepts and operators.
	- **Coroutines**. Lightweight threads integrated into the language, simplifying asynchronous programming. Kotlin coroutines are launched and suspended within the main thread, making them easier to manage than traditional threads. It is library functions and has top-down simple execution.
- **Coroutine Dispatcher** is a component that **determines where and how a coroutine is executed**. It essentially dictates the thread or thread pool on which the coroutine's code will run.
	- Unconfined dispatcher changes thread after first suspension point(delay/sleep)
	- Confined will stick one thread after a suspension point
- **Context Switching** refers to the process of saving the state of one coroutine and restoring the state of another when switching between their execution. 
- using `launch { <some-code>}` you can start a thread in a code
- Stream types:
	- Hot - one producer for all observers
	- Cold - one producer for each observer
- **List** - Ordered collection: Holds a fixed number of elements accessible by index.
- **Sequence** - Lazy collection: Generates elements on demand, potentially infinite.
- **Flow** - Asynchronous sequence: Represents a stream of values emitted over time.
	- Flows are not blocking and they are cold
	- Flow with buffer works faster
	- Flow Composing
		- **Zip:** Combines elements from two flows, pairing them up based on order, until one flow runs out. 
		- **Combine:** Accumulates results from multiple flows into a single value using a combining function.
- Channels
	```kotlin
	import kotlinx.coroutines.*
	import kotlinx.coroutines.channels.Channel
	
	fun main() = runBlocking {
	    // Create a channel (unbuffered by default)
	    val channel = Channel<Int>()
	    // Launch a producer coroutine to send values into the channel
	    launch {
	        for (i in 1..5) {
	            channel.send(i) // Suspends until a receiver is ready
	            println("Sent $i")
	        }
	        channel.close() // Close the channel to signal completion
	    }
	    // Launch a consumer coroutine to receive values from the channel
	    launch {
	        for (i in channel) { // Suspends until a value is available
	            println("Received $i")
	        }
	    }
	}
	```
	- The Output:
	```
	Sent 1
	Received 1
	Sent 2
	Received 2
	Sent 3
	Received 3
	Sent 4
	Received 4
	Sent 5
	Received 5
	```
# S7
- Storage types
	- **App-Specific Storage** - data is stored outside or inside app's directory, and can be accessible only by app.
		- less space
		- if data is needed when app starts, or app cannot function without the data, the data should be stored internally.
		- if data is only meaningful to your app then app-specific is the choice. 
	- **Shared Storage** - data that can be shared with other apps.
	- **Preferences** - Store private, primitive data in key-value pairs.
		- structured data with 2 columns
		- SharedPreferences APIs. A SharedPreferences object points to a file containing key-value pairs and provides simple methods to read and write them. 
	- **Databases** - Store structured data in a private database using the Room persistence library.
		- structured data with more than 2 columns
- physical storage locations
	- internal - limited but avalable for all devices
	- external - more capacity. located in smth like `/sdcard`
		- Android defines the following storage-related permissions: `READ_EXTERNAL_STORAGE`, `WRITE_EXTERNAL_STORAGE`, and `MANAGE_EXTERNAL_STORAGE`(read+write).
- Save key-value data
	- to stored pair of values use `SharedPreferences` API
	- get preferences file
		- `getSharedPreferences()` allows getting data from shared preference files, can be called in any context, can call multiple files.
			- In following code, preference file is `R.string.preference_file_key` which is called in private mode. 
		```kotlin
			val sharedPref = activity?.getSharedPreferences(getString(R.string.preference_file_key), Context.MODE_PRIVATE)
		``` 
		- `getPreferences()` allows getting data from one specific preferences file that belongs to an Activity
			- similarly
	```kotlin
		  val sharedPref = activity?.getPreferences(Context.MODE_PRIVATE)
	```
	- to write into preferences file:
		- `edit()` to start editing the file
		- `putInt()`,` putString()` to put new value in it
		- `apply()`, `commit()` to apply changes
			- `commit()` applies changes sync while `apply()` async. Do not use `commit()` in main thread as it will pause the app.
	```kotlin
		val sharedPref = activity?.getPreferences(Context.MODE_PRIVATE)?: return
		with (sharedPref.edit()) {
		putInt(getString(R.string.saved_high_score_key), newHighScore)
		apply()
		}
	```
	- read the preferences file
		- `getInt()`,`getString()` to read the file
	```kotlin
		val sharedPref = activity?.getPreferences(Context.MODE_PRIVATE) ?: return
		val defaultValue = resources.getInteger(R.integer.saved_high_score_default_key)
		val highScore = sharedPref.getInt(getString(R.string.saved_high_score_key), defaultValue)
	```
- Save data in a local database using Room
	- the Room persistence library allows accessing SQLite database
		- it allows creating queries
		- minimizes errors in coding
		- facilates database migrations
		- it is better to Room instead of SQLite API directly (it is like TypeORM in backend development)
		- to use it you need to add dependencies in `build.gradle`
	- Major components
		- **database class** - holds database and it is main access point to the database
		- **data entries** - represents tables in database
		- **data access object (DAO)** - methods to query update insert and delete data
	- Data entity - each instance of data entity represents a row in table. To create an entity use `@Entity` decorator and put data fields inside like primary keys and columns.
	```kotlin
		@Entity(tableName = "users")
		data class User(
			@PrimaryKey val uid: Int,
			@ColumnInfo(name = "first_name") val firstName: String?,
			@ColumnInfo(name = "last_name") val lastName: String?
		)
	```
		- you can make a composite key instead of primary with `@Entity(primaryKeys = ["firstName", "lastName"])`
	- DAO. In DAO you specify methods and queries binded with to them. You can use `@Query` for custom queries and specific ones with `@Delete` and `@Insert` 
	```kotlin
	@Dao
	interface UserDao {
		@Query("SELECT * FROM user")
		fun getAll(): List<User>
		
		@Query("SELECT * FROM user WHERE uid IN (:userIds)")
		fun loadAllByIds(userIds: IntArray): List<User>
		
		@Query("SELECT * FROM user WHERE first_name LIKE :first
		AND " + "last_name LIKE :last LIMIT 1")
		fun findByName(first: String, last: String): User
		
		@Insert
		fun insertAll(vararg users: User)
		
		@Delete
		fun delete
	}
	```
	- Database
		- to create a database you need to pass into it DAO and Entity
	```kotlin
		@Database(entities = [User::class], version = 1)
		abstract class AppDatabase : RoomDatabase() {
			abstract fun userDao(): UserDao
		}
	```
	- Usage
		- create an instance of db
		```kotlin
		val db = Room.databaseBuilder(
			applicationContext,
			AppDatabase::class.java, "database-name"
		).build()
		```
		- to interact with it
	```kotlin
		val userDao = db.userDao()
		val users: List<User> = userDao.getAll()
	```
	- the Room access to database asynchronously without blocking UI in main thread.  It also uses Async queries:
		- One-shot write, One-shot read queries, Observable read queries
# S8 
- HTTP
- to access network from app you need to grant access
  ```xml
  <uses-permission android:name="android.permission.INTERNET" />
  <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
	```
- Security best practices for accessing the internet
	- minimum of user data that can be transferred through the internet in order to not expose data
	- use SSL/TLS
	- configure trust to CA
- Android has HttpsURLConnection client
	- supports TLS,  streaming uploads and downloads, configurable timeouts, IPv6, and connection pooling
	- the library has **Retrofit HTTP** that lets creating HTTP client.
	- To simplify usage of HTTP client in various parts of the app you can use Repository Design Pattern in code that allows reducing code duplication.
	- In following interface you specify method of how to use HTTP request to get data from `/users/{id}` endpoint
	```kotlin
	interface UserService {
		@GET("/users/{id}")
		suspend fun getUser(@Path("id") id: String): User
	}
	```
	- Another code:
	```kotlin
	class UserRepository constructor(private val userService: UserService) {
			suspend fun getUserById(id: String): User {
			return userService.getUser(id)
		}
	}
	```
	- Do not perform Network operations on main thread, run them in background. By default Android does not allow you to run it on main thread, if you do it will throw an exception: `NetworkOnMainThreadException`. 
- Survive configuration changes
	- when some configuration changes (such as screen rotation), some data maybe lost. 
	- **ViewModel** can be used to save data 
	- To use Headers in **Retrofit**:
	```kotlin
	// Static Headers
	@Headers("Cache-Control: max-age=640000")
	@GET("widget/list")
	Call<List<Widget>> widgetList();
	// 
	@Headers({
		"Accept: application/vnd.github.v3.full+json",
		"User-Agent: Retrofit-Sample-App"})
	@GET("users/{username}")
	Call<User> getUser(@Path("username") String username);
	
	// Dynamic Headers
	@GET("user")
	Call<User> getUser(@Header("Authorization") String auth)
	// 
	@GET("user")
	Call<User> getUser(@HeaderMap Map<String, String> headers)
	```
- Serialization - is the process of converting an object's state into a format that can be:
	- Stored: This can be on a disk, in a database, or any other form of secondary storage.
	- Transmitted: This can be over a network or any other form of communication channel.
	- ![[serialization.png]]
	- The reverse process—constructing a data structure or object from a series of bytes is **deserialization**.
	- ![[deserialization.png]]
- HTTP Interceptor it intercepts the traffic flow and allows monitoring and logging
	- A call to `chain.proceed(request)` is a critical part of each interceptor’s implementation.
	- interceptors can be chained
	- `OkHttp` uses lists to track interceptors, and interceptors are called in order.
	- Application Intercepters
		- ![[some code 1.png]]
	- Network Interceptors
		- ![[some code 2.png]]
# S9
- Dependency Injection is a technique where an object receives the objects it needs to function, rather than creating them itself. This is achieved by separating the creation of objects from their usage.
	- Advantages:
		- Reusability of code
		- Ease of refactoring
		- Ease of testing
- Classes rely on other classes: These are called dependencies.
	- There are serveral ways to handle dependencies:
		- **Creating** them: The class itself creates the needed objects.
		- **Grabbing** them: The class retrieves them from existing sources.
		- **Receiving** them: The class receives them as parameters.
	- And Another variant is **DI** - Classes are provided with their dependencies instead of creating or grabbing them themselves.
- Without DI:
	- **tight coupling** - which means a class directly creates and manages its dependencies. This makes the code inflexible and difficult to adapt.
	- **Reduced Reusability** - cannot reuse the code
	- **Testing Challenges** - hard to test
```kotlin
class Car {
	private val engine = Engine()
	fun start() {
	engine.start()
}
}
fun main(args: Array) {
	val car = Car()
	car.start()
}
// Car constructs its engine itself and it is not a DI
```
- With DI:
	- **Improved Reusability** - 
	- **Enhanced Testability** - 
```kotlin
class Car(private val engine: Engine) {
	fun start() {
		engine.start()
	}
}
fun main(args: Array) {
	val engine = Engine()
	val car = Car(engine)
	car.start()
}
```
- Types of DI:
	- **Constructor Injection** - You pass the dependencies of a class to its constructor.
	```kotlin
class Car(private val engine:Engine) {
	fun start() {
		engine.start()
	}
}
fun main(args: Array) {
	val engine = Engine()
	val car = Car(engine)
	car.start()
}
	```
	- **Field Injection (or Setter Injection)** - not in constructor, it will be like some parameter that will be assigned with dependency later.  With field injection, dependencies are instantiated after the class is created. 
	```kotlin
	class Car {
		lateinit var engine: Engine
		fun start() {
			engine.start()
		}
	}
	fun main(args: Array) {
		val car = Car()
		car.engine = Engine()
		car.start()
	}
	```
- **Inversion of control (IoC)** is a design principle in software engineering where the flow of control is **inverted** compared to traditional approaches. Instead of **custom code** deciding when and how to call **reusable libraries** for specific tasks, **a generic framework** takes control and strategically invokes the custom code when needed. It increases modularity of the program and make it extensible. 
- **Service Locator** -  improves decoupling of classes from concrete dependencies. 
	- it is a class that creates and stores dependencies and then provides those dependencies on demand.
	```kotlin
object ServiceLocator {
	fun getEngine(): Engine = Engine()
}
class Car {
	private val engine = ServiceLocator.getEngine()
	fun start() {
		engine.start()
	}
}
	fun main(args: Array) {
	val car = Car()
	car.start()
}
	```
	- harder to test because all the tests have to interact with the same global service locator.
	- Dependencies are encoded in the class implementation, not in the API surface. It negatively affects runtime
	- Difficult to manage. 
- Pros of DI
	- Reusability of classes and decoupling of dependencies
	- Ease of refactoring
	- Ease of testing
- Automated DI. 
	- Reflection-based solutions that connect dependencies at runtime.
	- Static solutions that generate the code to connect dependencies at compile time.
	- **Dagger** is a popular dependency injection library 
- Manual DI.
	- A lot of boilerplate code and can lead to code duplication
	- Dependencies have to be declared in order
	- It's difficult to reuse objects
		- to solve this you can use dependencies container  class. Someting like Service Locator.
		- You have to manage AppContainer yourself, creating instances for all dependencies by hand.
		- There is still a lot of boilerplate code. You need to create factories or parameters by hand depending on whether you want to reuse an object or not.
- Singleton pattern. 
	- Make the default constructor private, to prevent other objects from using the new operator with the Singleton class.
	- Create a static creation method that acts as a constructor. Under the hood, this method calls the private constructor to create an object and saves it in a static field.
	-  Whenever Singleton is called, the same object is always returned.
# S10
help of ***Gemini***
- ***Software architecture*** is the **high-level structure** of a software system. It defines the **components** of the system, their **relationships**, and how they **interact** with each other. It's like a blueprint that helps developers understand and build the system effectively.
- **MVC (Model-View-Controller)**
	- A popular architectural pattern used for developing user interfaces.
	- It separates the app into three parts:
		- **Model:** This component represents the data of the application. It handles the data logic, such as fetching, storing, and manipulating data. It's essentially the source of truth for your application's data.
		- **View:** This component represents the visual elements of the application, like the UI components (buttons, text fields, etc.) that the user interacts with. It displays the data retrieved from the model and doesn't contain any application logic.
		- **Controller:** This component acts as an intermediary between the model and the view. It handles user interactions (like button clicks or form submissions), updates the model accordingly, and instructs the view to update itself based on the changes in the model.
	- **Flow**:
		- User has some action on UI - View sends this information to Controller
		- Controller updates model
		- Model says to controloler then that Model changed 
		- Controller updates View (UI)
	- **Pros**:
		- separation of concers
		- the development of separate parts can be performed parallelly 
		- DRY - no reuse of code
	- **Cons**:
		- Increased Complexity
		- Multiple Programmers
- **MVVM (Model-View-ViewModel)**
	- An architectural pattern for building user interfaces, similar to MVC (Model-View-Controller). However, it introduces an additional layer called the **ViewModel** to further separate the concerns and improve maintainability. 
	- Three parts:
		- **Model:** Same as in MVC, the model represents the data of the application and handles the data logic.
		- **View:** Similar to MVC, the view represents the visual elements and displays data but doesn't contain any application logic.
		- **ViewModel:** This is the new component introduced in MVVM. It acts as an intermediary between the model and the view, responsible for:
		    - Exposing data from the model to the view in a way that's suitable for presentation.
		    - Handling user interactions from the view and updating the model accordingly.
		    - Notifying the view when the underlying data in the model changes.
	- **Flow**:
		- Similar to MVC but ViewModel
	- **Pros**:
		- Business Logic is not with UI
		- Easy to reuse components
		- Easy to maintain and test
	- **Cons**: 
		- very complicated for simple UIs
	- MVVM offers additional benefits in terms of separation of concerns, testability, and flexibility, making it a popular choice for complex user interfaces.
- **MVP (Model-View-Presenter)**
- **Clean Architecture**
	- it is a set of principles for designing software applications that are independent of frameworks, technologies, and databases. It aims to achieve this by separating the core business logic of the application from the details of how the application interacts with the outside world.
	- **Pros**:
		- Independent from Frameworks
		- isolation
		- testability
	- **Cons**:
		- Difficult for newcomers
		- a lot of coding: interfaces, data models, DTOs, Mappers
![[clean.png]]