package org.teameos.settings.device;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.PowerManager;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.provider.Settings;
import android.provider.Settings.SettingNotFoundException;
import android.os.SystemProperties;

public class DeviceSettings extends PreferenceActivity implements
        Preference.OnPreferenceChangeListener {

    private static final String PREF_KEYBOARD_LAYOUT = "keyboard_layout";
    private static final String PREF_MODE_SELECTOR = "touchpad_mode_selector";

    private static final int COPY_FILE_BUFFER_SIZE = 1024;
    private static final String DATA_PREFIX = "/data/data/";
    private static final String KEYBOARD_KCM_FILE = "asusec.kcm";
    private static final String KEYBOARD_KL_FILE = "asusec.kl";

    private static final String KEYSWAP_PROPERTY = "sys.dockkeys.change";

    private ListPreference mKeyboardLayout;
    private ListPreference mTouchpadModeSelectorPref;

    private static final String TAG = "DeviceSettings";

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.preferences);
        mKeyboardLayout = (ListPreference) getPreferenceScreen().findPreference(
                PREF_KEYBOARD_LAYOUT);
        mKeyboardLayout.setOnPreferenceChangeListener(this);

        mTouchpadModeSelectorPref = (ListPreference) getPreferenceScreen().findPreference(
                PREF_MODE_SELECTOR);
        int mode = getTouchpadModeSetting(0);
        mTouchpadModeSelectorPref.setValue(String.valueOf(mode));
        mTouchpadModeSelectorPref.setSummary(mTouchpadModeSelectorPref.getEntries()[mode]);
        mTouchpadModeSelectorPref.setOnPreferenceChangeListener(this);
    }

    private String getDataDir() {
        return DATA_PREFIX + getPackageName();
    }

    private void copyAsset (String fileIn, String fileOut) {
        try {
            InputStream inputStream = getAssets().open(fileIn);
            OutputStream outputStream;

            File outFile = new File(getDataDir(),fileOut);
            outputStream = new FileOutputStream(outFile);
            byte[] buffer = new byte[COPY_FILE_BUFFER_SIZE];
            int length;

            while ((length = inputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, length);
            }

            outputStream.close();
            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean onPreferenceChange(Preference preference, Object value) {
        if (preference.equals(mKeyboardLayout)) {
            final String newLanguage = (String) value;

            AlertDialog dialog = new AlertDialog.Builder(this)
                    .setTitle(R.string.warning)
                    .setMessage(R.string.caution_keyboard_layout)
                    .setPositiveButton(android.R.string.yes,
                            new DialogInterface.OnClickListener() {

                        public void onClick(DialogInterface dialog,
                                int which) {
                            setNewKeyboardLanguage(newLanguage);
                        }
                    }).setNegativeButton(android.R.string.no, null)
                    .create();

            dialog.show();
        } else if (preference.equals (mTouchpadModeSelectorPref)) {
            final String newMode = (String) value;
            putTouchpadModeSetting(Integer.parseInt((String)newMode));
        }
        return false;
    }

    private void setNewKeyboardLanguage(String language) {
        String keyboardKcm = language + ".kcm";
        String keyboardKl = language + ".kl";

        copyAsset(keyboardKcm, KEYBOARD_KCM_FILE);
        copyAsset(keyboardKl, KEYBOARD_KL_FILE);

        SystemProperties.set(KEYSWAP_PROPERTY, "1");
        while(!SystemProperties.get(KEYSWAP_PROPERTY).equals("2")) {
        }

        PowerManager pm = (PowerManager) getSystemService(Context.POWER_SERVICE);
        pm.reboot("");
    }

    private int getTouchpadModeSetting(int defaultValue) {
        int result = defaultValue;
        try {
            result = Settings.System.getInt(getContentResolver(),
                    Settings.System.EOS_TOUCHPAD_MODE);
        } catch (SettingNotFoundException snfe) {
        }
        return result;
    }

    private void putTouchpadModeSetting(int newMode)
    {
        android.provider.Settings.System.putInt(getContentResolver(),
                Settings.System.EOS_TOUCHPAD_MODE, newMode);
        mTouchpadModeSelectorPref.setValue(String.valueOf(newMode));
        mTouchpadModeSelectorPref.setSummary(mTouchpadModeSelectorPref.getEntries()[newMode]);
    }
}
