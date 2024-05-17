# Keep Google Play Services classes
-keep class com.google.android.gms.** { *; }

# Keep Google ML Kit classes
-keep class com.google.mlkit.** { *; }

# General rule to keep all classes that might be accessed via reflection or are part of serialized objects.
-keepclassmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
    public void set*(***);
    public *** get*();
}

# Specific rules for missing classes
-keep class com.google.android.gms.auth.api.credentials.** { *; }
-keep class com.google.mlkit.vision.text.** { *; }

# If you are using custom views or classes with reflection, consider adding specific rules like:
-keep public class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
    public <init>(android.content.Context, android.util.AttributeSet, int, int);
}