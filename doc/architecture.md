The Raspberry Pi is used as a local server for multiple independent projects. The applications intself will be developed and versioned in seperate repos.



The Architecture will be like follow:

Windows PC

&#x20;   |

&#x20;   | SSH / deployment

&#x20;   v

Raspberry Pi

&#x20;   |

&#x20;   +-- Mosquitto

&#x20;   |

&#x20;   +-- sensor-server

&#x20;   |

&#x20;   +-- future application

