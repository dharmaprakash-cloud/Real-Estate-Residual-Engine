import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

const Stack = createNativeStackNavigator();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="PropertyAnalysis">
        <Stack.Screen name="PropertyAnalysis" component={PropertyAnalysisScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;